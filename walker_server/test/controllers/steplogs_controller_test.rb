require 'test_helper'

class SteplogsControllerTest < ActionController::TestCase
  setup do
    @steplog = steplogs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:steplogs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create steplog" do
    assert_difference('Steplog.count') do
      post :create, steplog: { step: @steplog.step, userhash: @steplog.userhash }
    end

    assert_redirected_to steplog_path(assigns(:steplog))
  end

  test "should show steplog" do
    get :show, id: @steplog
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @steplog
    assert_response :success
  end

  test "should update steplog" do
    patch :update, id: @steplog, steplog: { step: @steplog.step, userhash: @steplog.userhash }
    assert_redirected_to steplog_path(assigns(:steplog))
  end

  test "should destroy steplog" do
    assert_difference('Steplog.count', -1) do
      delete :destroy, id: @steplog
    end

    assert_redirected_to steplogs_path
  end
end
