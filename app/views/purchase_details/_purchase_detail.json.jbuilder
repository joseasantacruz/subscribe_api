json.extract! purchase_detail, :id, :count, :price, :purchase_id, :product_id, :created_at, :updated_at
json.url purchase_detail_url(purchase_detail, format: :json)
