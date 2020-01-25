class CreateInvoices < ActiveRecord::Migration[6.0]
  # Создание таблицы invoices
  def change
    create_table :invoices do |t|
      t.integer :invoice_operation_number
      t.date :invoice_operation_date
      t.string :company_code
      t.references :batch, null: false, foreign_key: true

      t.timestamps
    end
  end
end
