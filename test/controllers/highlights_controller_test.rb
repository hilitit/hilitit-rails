require 'test_helper'

class HighlightsControllerTest < ActionController::TestCase
  include Devise::TestHelpers


  setup do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryGirl.create(:user)
    sign_in user
    @highlight = FactoryGirl.create(:highlight, user: user)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:highlights)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create highlight" do
    assert_difference('Highlight.count') do
      post :create, highlight: { user: users(:two), tag_name: 'div', selector: " BODY. div3 ", text: 'some text', hostname: "www.examples.com", port: 80, pathname: "index.html", protocol: "https", start_offset: 10, end_offset: 200  }
    end

    assert_redirected_to highlight_path(assigns(:highlight))
  end

  test "should show highlight" do
    get :show, id: @highlight
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @highlight
    assert_response :success
  end

  test "should update highlight" do
    patch :update, id: @highlight, highlight: { text: "some text and stuff"  }
    assert_redirected_to highlight_path(assigns(:highlight))
  end

  test "should destroy highlight" do
    assert_difference('Highlight.count', -1) do
      delete :destroy, id: @highlight
    end

    assert_redirected_to highlights_path
  end
end
