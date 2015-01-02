class Pizzeria < ActiveRecord::Base
  has_many :reviews
  has_many :comments, through: :reviews

  validates :name, presence: true
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true

  validates_uniqueness_of :street, scope: [:name, :city, :state]

  def address
    "#{city}, #{state} #{zip_code}"
  end

  def latest_reviews
    reviews.order(created_at: :desc).limit(3)
  end
end
