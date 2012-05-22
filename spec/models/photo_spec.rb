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

require 'spec_helper'

describe Photo do
  pending "add some examples to (or delete) #{__FILE__}"
end
