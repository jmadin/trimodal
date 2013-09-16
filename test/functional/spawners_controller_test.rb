require 'test_helper'

class SpawnersControllerTest < ActionController::TestCase
  setup do
    @spawner = spawners(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spawners)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spawner" do
    assert_difference('Spawner.count') do
      post :create, spawner: @spawner.attributes
    end

    assert_redirected_to spawner_path(assigns(:spawner))
  end

  test "should show spawner" do
    get :show, id: @spawner
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @spawner
    assert_response :success
  end

  test "should update spawner" do
    put :update, id: @spawner, spawner: @spawner.attributes
    assert_redirected_to spawner_path(assigns(:spawner))
  end

  test "should destroy spawner" do
    assert_difference('Spawner.count', -1) do
      delete :destroy, id: @spawner
    end

    assert_redirected_to spawners_path
  end
end
