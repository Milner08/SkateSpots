# == Schema Information
#
# Table name: votes
#
#  id            :integer         not null, primary key
#  voteable_type :string(255)
#  votable_id    :integer
#  user_id       :integer
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#  like          :boolean
#

require 'spec_helper'

describe Votes do
  pending "add some examples to (or delete) #{__FILE__}"
end
