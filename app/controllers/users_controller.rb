class UsersController < ApplicationController
  require 'csv'

  def index
    @users = User.all
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Thanks for voting!"
      redirect_to users_path
    else
      flash[:alert] = @user.errors.full_messages if @user.errors.any?
      redirect_to users_path
    end
  end
  
  def show
    @user = User.find(params[:id])
  end

  def votes
    @games1 = User.all.group(:game1).count
    @games2 = User.all.group(:game2).count
    @total_games = @games1.merge!(@games2) { |k, o, n| o + n }
  end
  
private
  def user_params
    params.require(:user).permit(:username, :email, :game1, :game2)
  end
end