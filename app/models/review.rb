class Review < ActiveRecord::Base
  has_many :comments
  has_many :upvotes

  belongs_to :user
  belongs_to :pizzeria

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 1000 }
  validates :rating, presence: true,
                     numericality: { greater_than_or_equal_to: 1,
                                     less_than_or_equal_to: 5 }
  validates :user, presence: true
  validates :pizzeria, presence: true

  def vote_count
    self.upvotes.count
  end

  def score
    self.upvotes.count
  end
end
