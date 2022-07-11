class UsersController < ApplicationController

  def index
    @users = User.all
    @user = User.new
    2.times do
      @user.votes.build
    end
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

private
  def user_params
    params.require(:user).permit(:username, :email, :avatar, votes_attributes: [:name, :graphics, :story, :challenge, :average])
  end
end