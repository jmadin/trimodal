require 'test_helper'

class FecundCoral2sControllerTest < ActionController::TestCase
  setup do
    @fecund_coral2 = fecund_coral2s(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fecund_coral2s)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fecund_coral2" do
    assert_difference('FecundCoral2.count') do
      post :create, fecund_coral2: @fecund_coral2.attributes
    end

    assert_redirected_to fecund_coral2_path(assigns(:fecund_coral2))
  end

  test "should show fecund_coral2" do
    get :show, id: @fecund_coral2
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fecund_coral2
    assert_response :success
  end

  test "should update fecund_coral2" do
    put :update, id: @fecund_coral2, fecund_coral2: @fecund_coral2.attributes
    assert_redirected_to fecund_coral2_path(assigns(:fecund_coral2))
  end

  test "should destroy fecund_coral2" do
    assert_difference('FecundCoral2.count', -1) do
      delete :destroy, id: @fecund_coral2
    end

    assert_redirected_to fecund_coral2s_path
  end
end
