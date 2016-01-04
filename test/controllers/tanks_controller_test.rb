require 'test_helper'

class TanksControllerTest < ActionController::TestCase
  setup do
    @tank = tanks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tanks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tank" do
    assert_difference('Tank.count') do
      post :create, tank: { registration_id: @tank.registration_id, size: @tank.size, station_id: @tank.station_id, type_of_fuel: @tank.type_of_fuel }
    end

    assert_redirected_to tank_path(assigns(:tank))
  end

  test "should show tank" do
    get :show, id: @tank
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tank
    assert_response :success
  end

  test "should update tank" do
    patch :update, id: @tank, tank: { registration_id: @tank.registration_id, size: @tank.size, station_id: @tank.station_id, type_of_fuel: @tank.type_of_fuel }
    assert_redirected_to tank_path(assigns(:tank))
  end

  test "should destroy tank" do
    assert_difference('Tank.count', -1) do
      delete :destroy, id: @tank
    end

    assert_redirected_to tanks_path
  end
end
