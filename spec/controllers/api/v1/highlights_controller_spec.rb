require "spec_helper"
require 'rspec_api_documentation/dsl'

RSpec.describe "HighlightsController", :type => :request do

  describe "JSON Api" do

    describe "New Highlights" do 
      it "should insert a new highlight" do 
      end
    end

    resource "Highlights" do 
      before(:each) do
        @user = FactoryGirl.create(:user, email: "asdf@domain.com") 
        @highlight = FactoryGirl.create(:highlight, user:  @user ) 
        @headers = {}
        @headers["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("#{@user.email}:#{@user.password}")
      end
      get '/api/highlights.json' do 
        example "listing " do 
          explanation "This method creates a new order."

          get '/api/highlights.json', {}, @headers
          #expect(response.status).to eq(200)
          expect(response).to be_success
          expect(response).to render_template("highlights/index")
          json = JSON.parse(response.body)
          expect(json.length).to eq(1)
          expect(json[0]['id']).to eq(@highlight.id)
          expect(json[0]['start_offset']).to eq(@highlight.start_offset)
          expect(json[0]['end_offset']).to eq(@highlight.end_offset)
        end
      end

      get "/api/highlights.json?path=" do 
        example "should query highlights using host,path,port,is_https" do 
          explanation "list the highlights"
          get '/api/highlights.json', {}, @headers
          #expect(response.status).to eq(200)
          expect(response).to be_success
          expect(response).to render_template("highlights/index")
          json = JSON.parse(response.body)
          expect(json.length).to eq(1)
          expect(json[0]['id']).to eq(@highlight.id)

        end
      end

    end






  end

end
