require 'test_helper'

class SlittersControllerTest < ActionController::TestCase
  setup do
    @slitter = slitters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:slitters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create slitter" do
    assert_difference('Slitter.count') do
      post :create, slitter: { machine: @slitter.machine, slittedcoil: @slitter.slittedcoil, slitteddate: @slitter.slitteddate, slitterdweight: @slitter.slitterdweight, slukey: @slitter.slukey, thickness: @slitter.thickness }
    end

    assert_redirected_to slitter_path(assigns(:slitter))
  end

  test "should show slitter" do
    get :show, id: @slitter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @slitter
    assert_response :success
  end

  test "should update slitter" do
    put :update, id: @slitter, slitter: { machine: @slitter.machine, slittedcoil: @slitter.slittedcoil, slitteddate: @slitter.slitteddate, slitterdweight: @slitter.slitterdweight, slukey: @slitter.slukey, thickness: @slitter.thickness }
    assert_redirected_to slitter_path(assigns(:slitter))
  end

  test "should destroy slitter" do
    assert_difference('Slitter.count', -1) do
      delete :destroy, id: @slitter
    end

    assert_redirected_to slitters_path
  end
end
