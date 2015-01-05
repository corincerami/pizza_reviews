class Comment < ActiveRecord::Base
  belongs_to :review
  belongs_to :user
  belongs_to :pizzera

  validates :title, length: { maximum: 50 }
  validates :body, presence: true
  validates :body, length: { maximum: 1000 }
  validates :user, presence: true
  validates :review, presence: true

  def pizzeria
    review.pizzeria
  end
end
