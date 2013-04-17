require 'test_helper'

class FinishgoodsControllerTest < ActionController::TestCase
  setup do
    @finishgood = finishgoods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:finishgoods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create finishgood" do
    assert_difference('Finishgood.count') do
      post :create, finishgood: { displaydate: @finishgood.displaydate, extprogcode: @finishgood.extprogcode, mach: @finishgood.mach, procdate: @finishgood.procdate, prodname: @finishgood.prodname, unita2: @finishgood.unita2, unita: @finishgood.unita, unitb: @finishgood.unitb, unitc: @finishgood.unitc, unitd: @finishgood.unitd }
    end

    assert_redirected_to finishgood_path(assigns(:finishgood))
  end

  test "should show finishgood" do
    get :show, id: @finishgood
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @finishgood
    assert_response :success
  end

  test "should update finishgood" do
    put :update, id: @finishgood, finishgood: { displaydate: @finishgood.displaydate, extprogcode: @finishgood.extprogcode, mach: @finishgood.mach, procdate: @finishgood.procdate, prodname: @finishgood.prodname, unita2: @finishgood.unita2, unita: @finishgood.unita, unitb: @finishgood.unitb, unitc: @finishgood.unitc, unitd: @finishgood.unitd }
    assert_redirected_to finishgood_path(assigns(:finishgood))
  end

  test "should destroy finishgood" do
    assert_difference('Finishgood.count', -1) do
      delete :destroy, id: @finishgood
    end

    assert_redirected_to finishgoods_path
  end
end
