require 'test_helper'

class MachineinfosControllerTest < ActionController::TestCase
  setup do
    @machineinfo = machineinfos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:machineinfos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create machineinfo" do
    assert_difference('Machineinfo.count') do
      post :create, machineinfo: { mc_id: @machineinfo.mc_id, name: @machineinfo.name, status: @machineinfo.status, type: @machineinfo.type }
    end

    assert_redirected_to machineinfo_path(assigns(:machineinfo))
  end

  test "should show machineinfo" do
    get :show, id: @machineinfo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @machineinfo
    assert_response :success
  end

  test "should update machineinfo" do
    put :update, id: @machineinfo, machineinfo: { mc_id: @machineinfo.mc_id, name: @machineinfo.name, status: @machineinfo.status, type: @machineinfo.type }
    assert_redirected_to machineinfo_path(assigns(:machineinfo))
  end

  test "should destroy machineinfo" do
    assert_difference('Machineinfo.count', -1) do
      delete :destroy, id: @machineinfo
    end

    assert_redirected_to machineinfos_path
  end
end
