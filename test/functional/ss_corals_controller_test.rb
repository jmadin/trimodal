require 'test_helper'

class SsCoralsControllerTest < ActionController::TestCase
  setup do
    @ss_coral = ss_corals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ss_corals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ss_coral" do
    assert_difference('SsCoral.count') do
      post :create, ss_coral: @ss_coral.attributes
    end

    assert_redirected_to ss_coral_path(assigns(:ss_coral))
  end

  test "should show ss_coral" do
    get :show, id: @ss_coral
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ss_coral
    assert_response :success
  end

  test "should update ss_coral" do
    put :update, id: @ss_coral, ss_coral: @ss_coral.attributes
    assert_redirected_to ss_coral_path(assigns(:ss_coral))
  end

  test "should destroy ss_coral" do
    assert_difference('SsCoral.count', -1) do
      delete :destroy, id: @ss_coral
    end

    assert_redirected_to ss_corals_path
  end
end
