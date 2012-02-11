require 'test_helper'

class ConcernsControllerTest < ActionController::TestCase
  setup do
    @concern = concerns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:concerns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create concern" do
    assert_difference('Concern.count') do
      post :create, concern: @concern.attributes
    end

    assert_redirected_to concern_path(assigns(:concern))
  end

  test "should show concern" do
    get :show, id: @concern
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @concern
    assert_response :success
  end

  test "should update concern" do
    put :update, id: @concern, concern: @concern.attributes
    assert_redirected_to concern_path(assigns(:concern))
  end

  test "should destroy concern" do
    assert_difference('Concern.count', -1) do
      delete :destroy, id: @concern
    end

    assert_redirected_to concerns_path
  end
end
