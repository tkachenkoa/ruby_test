# Модель для объекта Batch (загрузка файла)
class Batch < ActiveRecord::Base
    has_many :invoices
    # Метод, возвращающий ID загруженного файла по GUID (проверяет наличие файла с данным GUID в БД)
    def self.find_batch_by_guid(guid)
        batch = Batch.select("batch_id").where(:guid => guid).first
        return batch
    end
end
