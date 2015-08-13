json.array!(@stocks) do |stock|
  json.extract! stock, :id, :item_id, :qtypresent, :expiry
  json.url stock_url(stock, format: :json)
end
