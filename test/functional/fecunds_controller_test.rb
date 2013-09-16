require 'test_helper'

class FecundsControllerTest < ActionController::TestCase
  setup do
    @fecund = fecunds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fecunds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fecund" do
    assert_difference('Fecund.count') do
      post :create, fecund: @fecund.attributes
    end

    assert_redirected_to fecund_path(assigns(:fecund))
  end

  test "should show fecund" do
    get :show, id: @fecund
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fecund
    assert_response :success
  end

  test "should update fecund" do
    put :update, id: @fecund, fecund: @fecund.attributes
    assert_redirected_to fecund_path(assigns(:fecund))
  end

  test "should destroy fecund" do
    assert_difference('Fecund.count', -1) do
      delete :destroy, id: @fecund
    end

    assert_redirected_to fecunds_path
  end
end
