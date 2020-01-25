class CreateInvoiceDataItems < ActiveRecord::Migration[6.0]
  # Создание таблицы invoice_data_items
  def change
    create_table :invoice_data_items do |t|
      t.string :parcel_code
      t.integer :item_qty
      t.integer :parcel_price
      t.references :invoice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
