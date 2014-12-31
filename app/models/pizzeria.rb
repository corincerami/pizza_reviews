class Pizzeria < ActiveRecord::Base
	has_many :reviews

  validates :name, presence: true
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true

  validates_uniqueness_of :street, scope: [:name, :city, :state]
end
