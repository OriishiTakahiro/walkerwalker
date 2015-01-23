require 'test_helper'

class GpsquestsControllerTest < ActionController::TestCase
  setup do
    @gpsquest = gpsquests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gpsquests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gpsquest" do
    assert_difference('Gpsquest.count') do
      post :create, gpsquest: { latitude: @gpsquest.latitude, longitude: @gpsquest.longitude, reward: @gpsquest.reward }
    end

    assert_redirected_to gpsquest_path(assigns(:gpsquest))
  end

  test "should show gpsquest" do
    get :show, id: @gpsquest
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gpsquest
    assert_response :success
  end

  test "should update gpsquest" do
    patch :update, id: @gpsquest, gpsquest: { latitude: @gpsquest.latitude, longitude: @gpsquest.longitude, reward: @gpsquest.reward }
    assert_redirected_to gpsquest_path(assigns(:gpsquest))
  end

  test "should destroy gpsquest" do
    assert_difference('Gpsquest.count', -1) do
      delete :destroy, id: @gpsquest
    end

    assert_redirected_to gpsquests_path
  end
end
