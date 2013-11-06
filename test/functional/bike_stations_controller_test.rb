require 'test_helper'

class BikeStationsControllerTest < ActionController::TestCase
  setup do
    @bike_station = bike_stations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bike_stations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bike_station" do
    assert_difference('BikeStation.count') do
      post :create, bike_station: { address: @bike_station.address, coordinates: @bike_station.coordinates, spaces: @bike_station.spaces, status: @bike_station.status }
    end

    assert_redirected_to bike_station_path(assigns(:bike_station))
  end

  test "should show bike_station" do
    get :show, id: @bike_station
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bike_station
    assert_response :success
  end

  test "should update bike_station" do
    put :update, id: @bike_station, bike_station: { address: @bike_station.address, coordinates: @bike_station.coordinates, spaces: @bike_station.spaces, status: @bike_station.status }
    assert_redirected_to bike_station_path(assigns(:bike_station))
  end

  test "should destroy bike_station" do
    assert_difference('BikeStation.count', -1) do
      delete :destroy, id: @bike_station
    end

    assert_redirected_to bike_stations_path
  end
end
