class AlterInvoiceDataItemsTableDecreaseIntemQtyColumnSize < ActiveRecord::Migration[6.0]
  # Уменьшаем размер поля item_qty до smallint
  def change
    change_column :invoice_data_items, :item_qty, :integer, :limit => 2
  end
end
