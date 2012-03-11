require 'test_helper'

class SmartCategoriesControllerTest < ActionController::TestCase
  setup do
    @smart_category = smart_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:smart_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create smart_category" do
    assert_difference('SmartCategory.count') do
      post :create, :smart_category => @smart_category.attributes
    end

    assert_redirected_to smart_category_path(assigns(:smart_category))
  end

  test "should show smart_category" do
    get :show, :id => @smart_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @smart_category
    assert_response :success
  end

  test "should update smart_category" do
    put :update, :id => @smart_category, :smart_category => @smart_category.attributes
    assert_redirected_to smart_category_path(assigns(:smart_category))
  end

  test "should destroy smart_category" do
    assert_difference('SmartCategory.count', -1) do
      delete :destroy, :id => @smart_category
    end

    assert_redirected_to smart_categories_path
  end
end
