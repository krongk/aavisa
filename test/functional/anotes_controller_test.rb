require 'test_helper'

class AnotesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:anotes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create anote" do
    assert_difference('Anote.count') do
      post :create, :anote => { }
    end

    assert_redirected_to anote_path(assigns(:anote))
  end

  test "should show anote" do
    get :show, :id => anotes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => anotes(:one).to_param
    assert_response :success
  end

  test "should update anote" do
    put :update, :id => anotes(:one).to_param, :anote => { }
    assert_redirected_to anote_path(assigns(:anote))
  end

  test "should destroy anote" do
    assert_difference('Anote.count', -1) do
      delete :destroy, :id => anotes(:one).to_param
    end

    assert_redirected_to anotes_path
  end
end
