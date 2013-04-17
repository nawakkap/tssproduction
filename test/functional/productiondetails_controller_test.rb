require 'test_helper'

class ProductiondetailsControllerTest < ActionController::TestCase
  setup do
    @productiondetail = productiondetails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:productiondetails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create productiondetail" do
    assert_difference('Productiondetail.count') do
      post :create, productiondetail: { production_id: @productiondetail.production_id, productionreason_id: @productiondetail.productionreason_id, time: @productiondetail.time }
    end

    assert_redirected_to productiondetail_path(assigns(:productiondetail))
  end

  test "should show productiondetail" do
    get :show, id: @productiondetail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @productiondetail
    assert_response :success
  end

  test "should update productiondetail" do
    put :update, id: @productiondetail, productiondetail: { production_id: @productiondetail.production_id, productionreason_id: @productiondetail.productionreason_id, time: @productiondetail.time }
    assert_redirected_to productiondetail_path(assigns(:productiondetail))
  end

  test "should destroy productiondetail" do
    assert_difference('Productiondetail.count', -1) do
      delete :destroy, id: @productiondetail
    end

    assert_redirected_to productiondetails_path
  end
end
