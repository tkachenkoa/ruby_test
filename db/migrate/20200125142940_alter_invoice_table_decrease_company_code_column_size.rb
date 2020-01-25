class AlterInvoiceTableDecreaseCompanyCodeColumnSize < ActiveRecord::Migration[6.0]
  # Уменьшаем размер поля company_code до smallint
  def change
    change_column :invoices, :company_code, :integer, :limit => 2
  end
end
