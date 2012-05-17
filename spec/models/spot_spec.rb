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

require 'spec_helper'

describe Spot do
  pending "add some examples to (or delete) #{__FILE__}"
end
