require "spec_helper"

## http://railsapps.github.io/tutorial-rails-devise-rspec-cucumber.html

describe ApplicationController do
  controller do
    def after_sign_in_path_for(resource)
        super resource
    end
  end

  before (:each) do
    @user = FactoryGirl.create(:user)
  end

  describe "After sigin-in" do

    it "redirects to the / page" do
      sign_in :user, @user
      expect(controller.after_sign_in_path_for(@user)).to eq("/")
    end

  end
end
