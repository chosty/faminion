require 'test_helper'

class PostfavsControllerTest < ActionController::TestCase
  setup do
    @postfav = postfavs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:postfavs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create postfav" do
    assert_difference('Postfav.count') do
      post :create, postfav: { post_id: @postfav.post_id, user_id: @postfav.user_id }
    end

    assert_redirected_to postfav_path(assigns(:postfav))
  end

  test "should show postfav" do
    get :show, id: @postfav
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @postfav
    assert_response :success
  end

  test "should update postfav" do
    patch :update, id: @postfav, postfav: { post_id: @postfav.post_id, user_id: @postfav.user_id }
    assert_redirected_to postfav_path(assigns(:postfav))
  end

  test "should destroy postfav" do
    assert_difference('Postfav.count', -1) do
      delete :destroy, id: @postfav
    end

    assert_redirected_to postfavs_path
  end
end
