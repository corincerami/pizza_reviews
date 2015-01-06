class Review < ActiveRecord::Base
  has_many :comments
  has_many :votes

  belongs_to :user
  belongs_to :pizzeria

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 1000 }
  validates :rating, presence: true,
                     numericality: { greater_than_or_equal_to: 1,
                                     less_than_or_equal_to: 5 }
  validates :user, presence: true
  validates :pizzeria, presence: true

  def total_votes
    votes.count
  end

  def score
    score = 0
    votes.each do |vote|
      score += vote.value
    end
    score
  end
end
