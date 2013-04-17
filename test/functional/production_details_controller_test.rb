require 'test_helper'

class ProductionDetailsControllerTest < ActionController::TestCase
  setup do
    @production_detail = production_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:production_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create production_detail" do
    assert_difference('ProductionDetail.count') do
      post :create, production_detail: { production_reason_id: @production_detail.production_reason_id, production_ukey: @production_detail.production_ukey, time: @production_detail.time }
    end

    assert_redirected_to production_detail_path(assigns(:production_detail))
  end

  test "should show production_detail" do
    get :show, id: @production_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @production_detail
    assert_response :success
  end

  test "should update production_detail" do
    put :update, id: @production_detail, production_detail: { production_reason_id: @production_detail.production_reason_id, production_ukey: @production_detail.production_ukey, time: @production_detail.time }
    assert_redirected_to production_detail_path(assigns(:production_detail))
  end

  test "should destroy production_detail" do
    assert_difference('ProductionDetail.count', -1) do
      delete :destroy, id: @production_detail
    end

    assert_redirected_to production_details_path
  end
end
