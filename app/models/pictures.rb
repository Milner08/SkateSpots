# == Schema Information
#
# Table name: pictures
#
#  id          :integer         not null, primary key
#  user_id     :integer
#  spot_id     :integer
#  description :text
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  url         :string(255)
#

class Pictures < ActiveRecord::Base
  attr_accessible :description, :spot_id, :user_id, :url

  has_attached_file :picture, :styles => { :large => "500x500>", :medium => "300x300>", :thumb => "100x100>" }

  belongs_to :user
  belongs_to :spot

end
