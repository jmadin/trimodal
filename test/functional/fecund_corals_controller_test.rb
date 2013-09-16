require 'test_helper'

class FecundCoralsControllerTest < ActionController::TestCase
  setup do
    @fecund_coral = fecund_corals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fecund_corals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fecund_coral" do
    assert_difference('FecundCoral.count') do
      post :create, fecund_coral: @fecund_coral.attributes
    end

    assert_redirected_to fecund_coral_path(assigns(:fecund_coral))
  end

  test "should show fecund_coral" do
    get :show, id: @fecund_coral
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fecund_coral
    assert_response :success
  end

  test "should update fecund_coral" do
    put :update, id: @fecund_coral, fecund_coral: @fecund_coral.attributes
    assert_redirected_to fecund_coral_path(assigns(:fecund_coral))
  end

  test "should destroy fecund_coral" do
    assert_difference('FecundCoral.count', -1) do
      delete :destroy, id: @fecund_coral
    end

    assert_redirected_to fecund_corals_path
  end
end
