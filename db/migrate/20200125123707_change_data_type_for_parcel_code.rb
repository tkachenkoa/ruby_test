class ChangeDataTypeForParcelCode < ActiveRecord::Migration[6.0]
  # Миграция, меняющая тип данных для поля invoice_data_items.parcel_code на строку
  def change
    change_table :invoice_data_items do |t|
      t.change :parcel_code, :string
    end
  end
end
