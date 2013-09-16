require 'test_helper'

class FieldtripsControllerTest < ActionController::TestCase
  setup do
    @fieldtrip = fieldtrips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fieldtrips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fieldtrip" do
    assert_difference('Fieldtrip.count') do
      post :create, fieldtrip: @fieldtrip.attributes
    end

    assert_redirected_to fieldtrip_path(assigns(:fieldtrip))
  end

  test "should show fieldtrip" do
    get :show, id: @fieldtrip
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fieldtrip
    assert_response :success
  end

  test "should update fieldtrip" do
    put :update, id: @fieldtrip, fieldtrip: @fieldtrip.attributes
    assert_redirected_to fieldtrip_path(assigns(:fieldtrip))
  end

  test "should destroy fieldtrip" do
    assert_difference('Fieldtrip.count', -1) do
      delete :destroy, id: @fieldtrip
    end

    assert_redirected_to fieldtrips_path
  end
end
