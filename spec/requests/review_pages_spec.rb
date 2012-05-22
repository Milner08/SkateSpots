require 'spec_helper'

describe "Reviews pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  let(:spot) { FactoryGirl.create(:spot, user_id: user.id) }
  before { sign_in user }

  describe "review creation" do
    before { visit spot_path(spot) }

    describe "with invalid information" do

      it "should not create a review" do
        expect { click_button "Post" }.should_not change(Review, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('Failed') } 
      end
    end

    describe "with valid information" do

      before { fill_in 'review_content', with: "Lorem ipsum" }
      it "should create a review" do
        expect { click_button "Post" }.should change(Review, :count).by(1)
      end
    end
  end
  
  describe "review destruction" do
    before { FactoryGirl.create(:review, user: user, spot: spot) }

    describe "as correct user" do
      before { visit spot_path(spot) }

      it "should delete a review" do
        expect { click_link "delete" }.should change(Review, :count).by(-1)
      end
    end
  end
end