json.extract! invoice, :id, :invoice_operation_number, :invoice_operation_date, :company_code, :batch_id, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
