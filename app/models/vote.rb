class Vote < ApplicationRecord
  require 'csv'
  belongs_to :user

  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :graphics, presence: true
  validates :story, presence: true
  validates :challenge, presence: true

  private

  def self.games
    CSV.open('./app/assets/csv/games.csv', headers: false)
  end
end
