require 'test_helper'

class ItemsUsersControllerTest < ActionController::TestCase
  setup do
    @items_user = items_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:items_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create items_user" do
    assert_difference('ItemsUser.count') do
      post :create, items_user: { item_id: @items_user.item_id, user_id: @items_user.user_id }
    end

    assert_redirected_to items_user_path(assigns(:items_user))
  end

  test "should show items_user" do
    get :show, id: @items_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @items_user
    assert_response :success
  end

  test "should update items_user" do
    patch :update, id: @items_user, items_user: { item_id: @items_user.item_id, user_id: @items_user.user_id }
    assert_redirected_to items_user_path(assigns(:items_user))
  end

  test "should destroy items_user" do
    assert_difference('ItemsUser.count', -1) do
      delete :destroy, id: @items_user
    end

    assert_redirected_to items_users_path
  end
end
