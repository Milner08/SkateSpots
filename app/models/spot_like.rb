class SpotLike < ActiveRecord::Base
  attr_accessible :spot_id, :user_id

  belongs_to :user
  belongs_to :spot

  validates :user_id, presence: true
  validates :spot_id, presence: true
end
