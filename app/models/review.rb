class Review < ActiveRecord::Base
  has_many :comments,
    dependent: :destroy
  has_many :votes

  belongs_to :user
  belongs_to :pizzeria

  validates :title, presence: true
  validates :title, length: { in: 1..50 }
  validates :body, presence: true
  validates :body, length: { in: 50..1000 }
  validates :rating, presence: true,
                     numericality: { greater_than_or_equal_to: 1,
                                     less_than_or_equal_to: 5 }
  validates :user, presence: true
  validates :pizzeria, presence: true

  def total_votes
    votes.count
  end

  def score
    votes.sum(:value)
  end

  mount_uploader :photo, ReviewPhotoUploader
end
