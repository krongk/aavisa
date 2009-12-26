require 'test_helper'

class BnotesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bnotes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bnote" do
    assert_difference('Bnote.count') do
      post :create, :bnote => { }
    end

    assert_redirected_to bnote_path(assigns(:bnote))
  end

  test "should show bnote" do
    get :show, :id => bnotes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => bnotes(:one).to_param
    assert_response :success
  end

  test "should update bnote" do
    put :update, :id => bnotes(:one).to_param, :bnote => { }
    assert_redirected_to bnote_path(assigns(:bnote))
  end

  test "should destroy bnote" do
    assert_difference('Bnote.count', -1) do
      delete :destroy, :id => bnotes(:one).to_param
    end

    assert_redirected_to bnotes_path
  end
end
