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
#  spotType    :string(255)
#

require 'spec_helper'

describe Spot do
  
end
