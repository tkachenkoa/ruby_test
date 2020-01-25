# Модель для объекта InvoiceDataItem (Товар, указанный в инфойсе)
class InvoiceDataItem < ApplicationRecord
  belongs_to :invoice
end
