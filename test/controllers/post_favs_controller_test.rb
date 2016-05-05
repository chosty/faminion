require 'test_helper'

class PostFavsControllerTest < ActionController::TestCase
  setup do
    @post_fav = post_favs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:post_favs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create post_fav" do
    assert_difference('PostFav.count') do
      post :create, post_fav: { post_id: @post_fav.post_id, user_id: @post_fav.user_id }
    end

    assert_redirected_to post_fav_path(assigns(:post_fav))
  end

  test "should show post_fav" do
    get :show, id: @post_fav
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @post_fav
    assert_response :success
  end

  test "should update post_fav" do
    patch :update, id: @post_fav, post_fav: { post_id: @post_fav.post_id, user_id: @post_fav.user_id }
    assert_redirected_to post_fav_path(assigns(:post_fav))
  end

  test "should destroy post_fav" do
    assert_difference('PostFav.count', -1) do
      delete :destroy, id: @post_fav
    end

    assert_redirected_to post_favs_path
  end
end
