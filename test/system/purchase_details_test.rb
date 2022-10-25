require "application_system_test_case"

class PurchaseDetailsTest < ApplicationSystemTestCase
  setup do
    @purchase_detail = purchase_details(:one)
  end

  test "visiting the index" do
    visit purchase_details_url
    assert_selector "h1", text: "Purchase details"
  end

  test "should create purchase detail" do
    visit purchase_details_url
    click_on "New purchase detail"

    fill_in "Count", with: @purchase_detail.count
    fill_in "Price", with: @purchase_detail.price
    fill_in "Product", with: @purchase_detail.product_id
    fill_in "Purchase", with: @purchase_detail.purchase_id
    click_on "Create Purchase detail"

    assert_text "Purchase detail was successfully created"
    click_on "Back"
  end

  test "should update Purchase detail" do
    visit purchase_detail_url(@purchase_detail)
    click_on "Edit this purchase detail", match: :first

    fill_in "Count", with: @purchase_detail.count
    fill_in "Price", with: @purchase_detail.price
    fill_in "Product", with: @purchase_detail.product_id
    fill_in "Purchase", with: @purchase_detail.purchase_id
    click_on "Update Purchase detail"

    assert_text "Purchase detail was successfully updated"
    click_on "Back"
  end

  test "should destroy Purchase detail" do
    visit purchase_detail_url(@purchase_detail)
    click_on "Destroy this purchase detail", match: :first

    assert_text "Purchase detail was successfully destroyed"
  end
end
