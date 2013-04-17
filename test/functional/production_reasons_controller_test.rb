require 'test_helper'

class ProductionReasonsControllerTest < ActionController::TestCase
  setup do
    @production_reason = production_reasons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:production_reasons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create production_reason" do
    assert_difference('ProductionReason.count') do
      post :create, production_reason: { description: @production_reason.description, mc_id: @production_reason.mc_id, seq: @production_reason.seq }
    end

    assert_redirected_to production_reason_path(assigns(:production_reason))
  end

  test "should show production_reason" do
    get :show, id: @production_reason
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @production_reason
    assert_response :success
  end

  test "should update production_reason" do
    put :update, id: @production_reason, production_reason: { description: @production_reason.description, mc_id: @production_reason.mc_id, seq: @production_reason.seq }
    assert_redirected_to production_reason_path(assigns(:production_reason))
  end

  test "should destroy production_reason" do
    assert_difference('ProductionReason.count', -1) do
      delete :destroy, id: @production_reason
    end

    assert_redirected_to production_reasons_path
  end
end
