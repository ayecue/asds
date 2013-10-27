require 'test_helper'

class LocationOwnershipsControllerTest < ActionController::TestCase
  setup do
    @location_ownership = location_ownerships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:location_ownerships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create location_ownership" do
    assert_difference('LocationOwnership.count') do
      post :create, location_ownership: { end: @location_ownership.end, location_id: @location_ownership.location_id, prolonged: @location_ownership.prolonged, start: @location_ownership.start, user_id: @location_ownership.user_id }
    end

    assert_redirected_to location_ownership_path(assigns(:location_ownership))
  end

  test "should show location_ownership" do
    get :show, id: @location_ownership
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @location_ownership
    assert_response :success
  end

  test "should update location_ownership" do
    patch :update, id: @location_ownership, location_ownership: { end: @location_ownership.end, location_id: @location_ownership.location_id, prolonged: @location_ownership.prolonged, start: @location_ownership.start, user_id: @location_ownership.user_id }
    assert_redirected_to location_ownership_path(assigns(:location_ownership))
  end

  test "should destroy location_ownership" do
    assert_difference('LocationOwnership.count', -1) do
      delete :destroy, id: @location_ownership
    end

    assert_redirected_to location_ownerships_path
  end
end
