json.extract! invoice_data_item, :id, :parcel_code, :item_qty, :parcel_price, :invoice_id, :created_at, :updated_at
json.url invoice_data_item_url(invoice_data_item, format: :json)
