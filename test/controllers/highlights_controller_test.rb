require 'test_helper'

class HighlightsControllerTest < ActionController::TestCase

  setup do
    @highlight = highlights(:one)
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
      post :create, highlight: {  user: users(:two), selector: " BODY. div2 ", text: 'soem text', host: "www.example.com", port: 80, path: "index.html", is_https: true, start_offset: 10, end_offset: 200 }
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
