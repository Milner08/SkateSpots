# == Schema Information
#
# Table name: likes
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  spot_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Like < ActiveRecord::Base
  attr_accessible :spot_id, :user_id

  belongs_to :user
  belongs_to :spot

  validates :user_id, presence: true
  validates :spot_id, presence: true
end
