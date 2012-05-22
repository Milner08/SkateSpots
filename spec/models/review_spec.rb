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

require 'spec_helper'

describe Review do

  let(:user) {FactoryGirl.create(:user)}
  before { 
  	@review = user.reviews.build(content: "Lorem ipsum") 
  	@review.spot_id = 1
  }

  subject { @review }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }
  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:spot_id) }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @review.user_id = nil }
    it { should_not be_valid }
  end

  describe "when spot_id is not present" do
    before { @review.spot_id = nil }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Review.new(user_id: user.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end
  describe "when user_id is not present" do
    before { @review.user_id = nil }
    it { should_not be_valid }
  end
end
