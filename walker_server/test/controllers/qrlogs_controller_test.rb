require 'test_helper'

class QrlogsControllerTest < ActionController::TestCase
  setup do
    @qrlog = qrlogs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:qrlogs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create qrlog" do
    assert_difference('Qrlog.count') do
      post :create, qrlog: { code: @qrlog.code, userhash: @qrlog.userhash }
    end

    assert_redirected_to qrlog_path(assigns(:qrlog))
  end

  test "should show qrlog" do
    get :show, id: @qrlog
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @qrlog
    assert_response :success
  end

  test "should update qrlog" do
    patch :update, id: @qrlog, qrlog: { code: @qrlog.code, userhash: @qrlog.userhash }
    assert_redirected_to qrlog_path(assigns(:qrlog))
  end

  test "should destroy qrlog" do
    assert_difference('Qrlog.count', -1) do
      delete :destroy, id: @qrlog
    end

    assert_redirected_to qrlogs_path
  end
end
