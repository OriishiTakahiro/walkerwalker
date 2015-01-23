require 'test_helper'

class GpslogsControllerTest < ActionController::TestCase
  setup do
    @gpslog = gpslogs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gpslogs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gpslog" do
    assert_difference('Gpslog.count') do
      post :create, gpslog: { latitude: @gpslog.latitude, longitude: @gpslog.longitude, userhash: @gpslog.userhash }
    end

    assert_redirected_to gpslog_path(assigns(:gpslog))
  end

  test "should show gpslog" do
    get :show, id: @gpslog
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gpslog
    assert_response :success
  end

  test "should update gpslog" do
    patch :update, id: @gpslog, gpslog: { latitude: @gpslog.latitude, longitude: @gpslog.longitude, userhash: @gpslog.userhash }
    assert_redirected_to gpslog_path(assigns(:gpslog))
  end

  test "should destroy gpslog" do
    assert_difference('Gpslog.count', -1) do
      delete :destroy, id: @gpslog
    end

    assert_redirected_to gpslogs_path
  end
end
