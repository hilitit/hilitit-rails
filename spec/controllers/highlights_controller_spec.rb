require "spec_helper"

RSpec.describe "HighlightsController", :type => :request do

  describe "JSON Api" do

   describe "New Highlights" do 
     it "should insert a new highlight" do 
     end
   end

   describe "Query Highlights" do 

    it "should query with web site" do 
      user = FactoryGirl.create(:user, email: "asdf@domain.com")
      highlight = FactoryGirl.create(:highlight, user: user)
      headers = {}
      headers["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("#{user.email}:#{user.password}")
      get '/highlights.json', {}, headers
      expect(response).to be_success
      json = JSON.parse(response.body)
      expect(json.length).to eq(1)
      expect(json[0]['id']).to eq(highlight.id)

    end
   end

  end

end
