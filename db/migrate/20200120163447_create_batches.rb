class CreateBatches < ActiveRecord::Migration[6.0]
  # Создание таблицы batches
  def change
    create_table :batches do |t|
      t.integer :batch_id
      t.date :creation_date
      t.string :guid

      t.timestamps
    end
  end
end
