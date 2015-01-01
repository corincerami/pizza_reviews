class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :pizzeria

  validates :title, presence: true
  validates :body, presence: true
  validates :rating, presence: true
end
