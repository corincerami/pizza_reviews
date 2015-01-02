class Comment < ActiveRecord::Base
  belongs_to :review
  belongs_to :user
  belongs_to :pizzeria

  validates :title, length: { maximum: 50 }
  validates :body, presence: true
  validates :body, length: { maximum: 1000 }
end
