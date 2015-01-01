class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :pizzeria
	has_many :comments
end
