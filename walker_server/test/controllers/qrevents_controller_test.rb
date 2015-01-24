require 'test_helper'

class QreventsControllerTest < ActionController::TestCase
  setup do
    @qrevent = qrevents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:qrevents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create qrevent" do
    assert_difference('Qrevent.count') do
      post :create, qrevent: { code: @qrevent.code, reward: @qrevent.reward }
    end

    assert_redirected_to qrevent_path(assigns(:qrevent))
  end

  test "should show qrevent" do
    get :show, id: @qrevent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @qrevent
    assert_response :success
  end

  test "should update qrevent" do
    patch :update, id: @qrevent, qrevent: { code: @qrevent.code, reward: @qrevent.reward }
    assert_redirected_to qrevent_path(assigns(:qrevent))
  end

  test "should destroy qrevent" do
    assert_difference('Qrevent.count', -1) do
      delete :destroy, id: @qrevent
    end

    assert_redirected_to qrevents_path
  end
end
