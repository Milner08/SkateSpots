# == Schema Information
#
# Table name: votes
#
#  id           :integer         not null, primary key
#  votable_type :string(255)
#  votable_id   :integer
#  user_id      :integer
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#  like         :boolean
#

class Vote < ActiveRecord::Base
  attr_accessible :like, :votable_id, :votable_type

  belongs_to :votable, :polymorphic => true
  belongs_to :user

  validates :user_id, presence: true
  validates :votable_id, presence: true

  def upvote?
    like
  end

  def downvote?
  	!like
  end

end
