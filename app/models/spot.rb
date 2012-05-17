# == Schema Information
#
# Table name: spots
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  address1    :string(255)
#  address2    :string(255)
#  city        :string(255)
#  postcode    :string(255)
#  user_id     :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  description :text
#

class Spot < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :name, :postcode, :user_id, :description

  has_many :reviews, dependent: :destroy

  has_many :spot_likes, :dependent => :destroy
  has_many :likes, through: :spot_likes

  has_many :pictures, :dependent => :destroy
  
  scope :recent, :limit => 4, :order => 'created_at DESC'
  
  validates :user_id, presence: true
  validates :name, presence: true, length: {minimum: 2}
  validates :city, presence:true, length: {minimum: 2}
  validates :postcode, length: {maximum: 8}
  validates :description, presence: true, length: {minimum: 10}

  def self.search(search)
	  if search
	    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
	  else
	    find(:all)
	  end
	end
end
