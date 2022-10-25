json.extract! product, :id, :name, :is_imported, :tax, :created_at, :updated_at
json.url product_url(product, format: :json)
