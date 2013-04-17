require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { acctw: @product.acctw, displayid: @product.displayid, estw: @product.estw, film: @product.film, id: @product.id, inprod: @product.inprod, nameeng: @product.nameeng, nameinit: @product.nameinit, nameth: @product.nameth, pcspack: @product.pcspack, pcstruck: @product.pcstruck, pct: @product.pct, size: @product.size, thmin: @product.thmin, threp: @product.threp, vat: @product.vat, wagekg: @product.wagekg, wdisplay: @product.wdisplay, wmax: @product.wmax, wmin: @product.wmin }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    put :update, id: @product, product: { acctw: @product.acctw, displayid: @product.displayid, estw: @product.estw, film: @product.film, id: @product.id, inprod: @product.inprod, nameeng: @product.nameeng, nameinit: @product.nameinit, nameth: @product.nameth, pcspack: @product.pcspack, pcstruck: @product.pcstruck, pct: @product.pct, size: @product.size, thmin: @product.thmin, threp: @product.threp, vat: @product.vat, wagekg: @product.wagekg, wdisplay: @product.wdisplay, wmax: @product.wmax, wmin: @product.wmin }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
