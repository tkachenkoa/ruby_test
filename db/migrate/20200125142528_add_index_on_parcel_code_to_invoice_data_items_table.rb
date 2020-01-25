class AddIndexOnParcelCodeToInvoiceDataItemsTable < ActiveRecord::Migration[6.0]
  # Добавляем индекс на поля invoice_id, parcel_code в таблицу invoice_data_items
  def change
    add_index :invoice_data_items, [:invoice_id, :parcel_code], unique: true
  end
end
