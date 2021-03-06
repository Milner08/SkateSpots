# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  password_digest :string(255)
#  remember_token  :string(255)
#  admin           :boolean         default(FALSE)
#  city            :string(255)
#  style           :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :city, :style
	
  has_secure_password

  has_many :reviews, dependent: :destroy 

  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships

  has_many :likes, dependent: :destroy
  has_many :liked_spots, through: :likes, source: :spot

  has_many :pictures, dependent: :destroy

  has_many :votes, dependent: :destroy

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :city, presence: true
  validates :style, presence: true

  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end

  def likes?(spot)
    likes.find_by_spot_id(spot.id)
  end

  def like!(spot)
    likes.create!(spot_id: spot.id)
  end

  def dislike!(spot)
    likes.find_by_spot_id(spot.id).destroy
  end

  def voted?(review)
    votes.find_by_votable_id(review.id)
  end

  def upvote!(review)
    votes.create!(votable_id: review.id, votable_type: review.class.name ,like: true)
  end

  def downvote!(review)
    votes.create!(votable_id: review.id, votable_type: review.class.name ,like: false)
  end

  def unvote!(review)
    votes.find_by_votable_id(review.id).destroy
  end

  def upvoted?(review)
    vote = votes.find_by_votable_id(review.id)
    vote.upvote?
  end

  def downvoted?(review)
    vote = votes.find_by_votable_id(review.id)
    vote.downvote?
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
