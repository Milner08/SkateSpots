# == Schema Information
#
# Table name: reviews
#
#  id         :integer         not null, primary key
#  content    :string(255)
#  user_id    :integer
#  spot_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Review < ActiveRecord::Base
  attr_accessible :content, :spot_id

  belongs_to :spot
  belongs_to :user

  has_many :votes, :as => :votable

  validates :user_id, presence: true
  validates :spot_id, presence: true
  validates :content, presence: true, length: {minimum: 10 }

  default_scope order: 'reviews.created_at DESC'

  def score
  	up = 0
  	down = 0
    counter = 0
  	self.votes.each do |v|
  		if v.upvote?
  			up += 1
  		elsif v.downvote?
  			down += 1
  		end
  		counter += 1
  	end
    logger.debug "The score loop iterated #{counter} times"
    score = 0
    if(up-down == 0)
      score = 0
    else
      score = (up-down)
    end
  end

end
