require 'test_helper'

class LocationPassingsControllerTest < ActionController::TestCase
  setup do
    @location_passing = location_passings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:location_passings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create location_passing" do
    assert_difference('LocationPassing.count') do
      post :create, location_passing: { enter_point: @location_passing.enter_point, entered_at: @location_passing.entered_at, exit_point: @location_passing.exit_point, exited_at: @location_passing.exited_at, location: @location_passing.location, user: @location_passing.user }
    end

    assert_redirected_to location_passing_path(assigns(:location_passing))
  end

  test "should show location_passing" do
    get :show, id: @location_passing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @location_passing
    assert_response :success
  end

  test "should update location_passing" do
    patch :update, id: @location_passing, location_passing: { enter_point: @location_passing.enter_point, entered_at: @location_passing.entered_at, exit_point: @location_passing.exit_point, exited_at: @location_passing.exited_at, location: @location_passing.location, user: @location_passing.user }
    assert_redirected_to location_passing_path(assigns(:location_passing))
  end

  test "should destroy location_passing" do
    assert_difference('LocationPassing.count', -1) do
      delete :destroy, id: @location_passing
    end

    assert_redirected_to location_passings_path
  end
end
