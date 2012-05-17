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

require 'spec_helper'

describe Pictures do
  pending "add some examples to (or delete) #{__FILE__}"
end
