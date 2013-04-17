require 'test_helper'

class ProductionreasonsControllerTest < ActionController::TestCase
  setup do
    @productionreason = productionreasons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:productionreasons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create productionreason" do
    assert_difference('Productionreason.count') do
      post :create, productionreason: { description: @productionreason.description, mc_id: @productionreason.mc_id, seq: @productionreason.seq }
    end

    assert_redirected_to productionreason_path(assigns(:productionreason))
  end

  test "should show productionreason" do
    get :show, id: @productionreason
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @productionreason
    assert_response :success
  end

  test "should update productionreason" do
    put :update, id: @productionreason, productionreason: { description: @productionreason.description, mc_id: @productionreason.mc_id, seq: @productionreason.seq }
    assert_redirected_to productionreason_path(assigns(:productionreason))
  end

  test "should destroy productionreason" do
    assert_difference('Productionreason.count', -1) do
      delete :destroy, id: @productionreason
    end

    assert_redirected_to productionreasons_path
  end
end
