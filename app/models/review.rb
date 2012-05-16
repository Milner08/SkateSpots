class Review < ActiveRecord::Base
  attr_accessible :content, :spot_id

  belongs_to :spot
  belongs_to :user

  validates :user_id, presence: true
  validates :spot_id, presence: true
  validates :content, presence: true, length: {minimum: 10 }

  default_scope order: 'reviews.created_at DESC'
end
