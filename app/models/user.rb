class User < ApplicationRecord
  before_save :set_average

  has_many :votes
  has_one_attached :avatar

  accepts_nested_attributes_for :votes, allow_destroy: true

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A\S+@.+\.\S+\z/ }
  validates :avatar, presence: true
  
  def votes_attributes=(votes_attributes)
    votes_attributes.each do |i, votes_attributes|
      self.votes.build(votes_attributes)
    end
  end

  def set_average
    votes.each do |attribute|
      average = (attribute.graphics.to_f + attribute.story.to_f+ attribute.challenge.to_f)/3
      attribute.average = average
    end
  end
end
