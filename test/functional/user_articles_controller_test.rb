require 'test_helper'

class UserArticlesControllerTest < ActionController::TestCase
  setup do
    @user_article = user_articles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_articles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_article" do
    assert_difference('UserArticle.count') do
      post :create, user_article: @user_article.attributes
    end

    assert_redirected_to user_article_path(assigns(:user_article))
  end

  test "should show user_article" do
    get :show, id: @user_article
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_article
    assert_response :success
  end

  test "should update user_article" do
    put :update, id: @user_article, user_article: @user_article.attributes
    assert_redirected_to user_article_path(assigns(:user_article))
  end

  test "should destroy user_article" do
    assert_difference('UserArticle.count', -1) do
      delete :destroy, id: @user_article
    end

    assert_redirected_to user_articles_path
  end
end
