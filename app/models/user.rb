class User < ActiveRecord::Base
  has_many :reviews
  has_many :comments
  has_many :votes
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
  mount_uploader :avatar, AvatarUploader

  def name
    "#{first_name.capitalize} #{last_initial.upcase}."
  end

  def has_voted?(review)
    votes.find_by(review: review)
  end

  def has_upvoted?(review)
    has_voted?(review) && votes.find_by(review: review).value == 1
  end

  def has_downvoted?(review)
    has_voted?(review) && votes.find_by(review: review).value == -1
  end
end
