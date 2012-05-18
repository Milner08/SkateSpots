# == Schema Information
#
# Table name: photos
#
#  id                   :integer         not null, primary key
#  user_id              :integer
#  spot_id              :integer
#  description          :text
#  created_at           :datetime        not null
#  updated_at           :datetime        not null
#  title                :string(255)
#  picture_file_name    :string(255)
#  picture_content_type :string(255)
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#

class Photo < ActiveRecord::Base
  attr_accessible :description, :spot_id, :user_id, :picture, :title

  has_attached_file :picture, :styles => { :large => "500x500>", :medium => "300x300>", :thumb => "150x150>" }

  belongs_to :user
  belongs_to :spot

  validates :title, presence: true
  validates :description, presence: true
  validates :spot_id, presence: true
  validates :user_id, presence: true
  validates :picture, presence: true

end
