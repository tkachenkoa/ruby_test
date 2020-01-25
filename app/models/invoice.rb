# Модель для объекта Инвойс
class Invoice < ApplicationRecord
  belongs_to :batch
  has_many :invoice_data_items
end
