require 'test_helper'

class EventTargetUsersControllerTest < ActionController::TestCase
  setup do
    @event_target_user = event_target_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_target_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_target_user" do
    assert_difference('EventTargetUser.count') do
      post :create, event_target_user: { event_id: @event_target_user.event_id, user_id: @event_target_user.user_id }
    end

    assert_redirected_to event_target_user_path(assigns(:event_target_user))
  end

  test "should show event_target_user" do
    get :show, id: @event_target_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_target_user
    assert_response :success
  end

  test "should update event_target_user" do
    patch :update, id: @event_target_user, event_target_user: { event_id: @event_target_user.event_id, user_id: @event_target_user.user_id }
    assert_redirected_to event_target_user_path(assigns(:event_target_user))
  end

  test "should destroy event_target_user" do
    assert_difference('EventTargetUser.count', -1) do
      delete :destroy, id: @event_target_user
    end

    assert_redirected_to event_target_users_path
  end
end
