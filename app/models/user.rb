class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :last_initial, length: { maximum: 1 }
  validates :bio, length: { maximum: 1000 }
  validates :last_initial, format: { with: /\A[a-zA-Z]+\z/,
                                     message: "only allows letters" }

  def name
    "#{first_name} #{last_initial}."
  end
end
