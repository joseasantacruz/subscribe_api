require "test_helper"

class PurchaseDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purchase_detail = purchase_details(:one)
  end

  test "should get index" do
    get purchase_details_url
    assert_response :success
  end

  test "should get new" do
    get new_purchase_detail_url
    assert_response :success
  end

  test "should create purchase_detail" do
    assert_difference("PurchaseDetail.count") do
      post purchase_details_url, params: { purchase_detail: { count: @purchase_detail.count, price: @purchase_detail.price, product_id: @purchase_detail.product_id, purchase_id: @purchase_detail.purchase_id } }
    end

    assert_redirected_to purchase_detail_url(PurchaseDetail.last)
  end

  test "should show purchase_detail" do
    get purchase_detail_url(@purchase_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_purchase_detail_url(@purchase_detail)
    assert_response :success
  end

  test "should update purchase_detail" do
    patch purchase_detail_url(@purchase_detail), params: { purchase_detail: { count: @purchase_detail.count, price: @purchase_detail.price, product_id: @purchase_detail.product_id, purchase_id: @purchase_detail.purchase_id } }
    assert_redirected_to purchase_detail_url(@purchase_detail)
  end

  test "should destroy purchase_detail" do
    assert_difference("PurchaseDetail.count", -1) do
      delete purchase_detail_url(@purchase_detail)
    end

    assert_redirected_to purchase_details_url
  end
end
