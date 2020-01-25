class AddFileAttachmentToBatch < ActiveRecord::Migration[6.0]
  # Добавление поля в таблицу batches
  def change
    add_column :batches, :batch_file, :string
  end
end
