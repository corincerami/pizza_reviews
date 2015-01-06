class Vote < ActiveRecord::Base
  belongs_to :review
  belongs_to :user

  validates :value, inclusion: [-1, 1]
end
