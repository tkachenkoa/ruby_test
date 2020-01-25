class AddIndexOnInvoiceOperationNumberToInvoiceTable < ActiveRecord::Migration[6.0]
  # Добавляем индекс на поле invoice_operation_number в таблицу invoices
  def change
    add_index :invoices, [:id, :invoice_operation_number], unique: true
  end
end
