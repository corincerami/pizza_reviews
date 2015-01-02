class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :pizzeria

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 1000 }
  validates :rating, presence: true, 
    numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :user, presence: true
  validates :pizzeria, presence: true
end
