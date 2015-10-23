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
        # no need for seeds
        Highlight.delete_all
        User.delete_all
        @user = FactoryGirl.create(:user, email: "asdf@domain.com") 
        @highlight = FactoryGirl.create(:highlight, user:  @user ) 
        @headers = {}
        @headers["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("#{@user.email}:#{@user.password}")
      end

      post '/api/highlights.json' do 
        example "create/post a new entry" do 
          explanation ""
          ahighlight = FactoryGirl.build(:highlight, user: nil ) 
          #puts ahighlight.to_json
          post '/api/highlights.json', {highlight: ahighlight.to_json}, @headers
          expect(response).to be_success
          expect(response).to render_template("highlights/show")
          json = JSON.parse(response.body)
          expect(json['selector']).to eq(ahighlight.selector)
          expect(json['start_offset']).to eq(ahighlight.start_offset)
          expect(json['end_offset']).to eq(ahighlight.end_offset)
        end
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

      get "/api/highlights.json?host=\#{HOST}&path=&\#{PATH}&is_https=\#{IS_HTTP}&port=\#{PORT}" do 
        example "should return empty result if not exists" do 
          explanation "empty [] if no highlights exist"
          get '/api/highlights.json', {host: "somedomain.com" , path: "index.html", is_https: false, port: 80 }, @headers
          #expect(response.status).to eq(200)
          expect(response).to be_success
          expect(response).to render_template("highlights/index")
          json = JSON.parse(response.body)
          expect(json.length).to eq(0)
        end

        example "should query highlights using host,path,port,is_https" do 
          get '/api/highlights.json', {host: @highlight.host , path: @highlight.path, is_https: @highlight.is_https, port: @highlight.port }, @headers
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
