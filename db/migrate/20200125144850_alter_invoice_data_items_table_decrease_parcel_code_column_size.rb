class AlterInvoiceDataItemsTableDecreaseParcelCodeColumnSize < ActiveRecord::Migration[6.0]
  # Уменьшаем размер поля parcel_code до string(15)
  def change
    change_column :invoice_data_items, :parcel_code, :string, :limit => 15
  end
end
