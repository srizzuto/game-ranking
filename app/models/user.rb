class User < ApplicationRecord

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A\S+@.+\.\S+\z/ }
  validates :game1, presence: true
  validates :game2, presence: true

  def self.games
    CSV.open('./app/assets/csv/games.csv', headers: false)
  end
end
