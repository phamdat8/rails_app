json.extract! product, :id, :sku, :title, :price, :quantity, :created_at, :updated_at
json.url product_url(product, format: :json)
