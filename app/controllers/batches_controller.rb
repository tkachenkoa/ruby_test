require "rexml/document"
include REXML

class BatchesController < ApplicationController
  # Инициализация данных объекта Batch
  before_action :set_batch, only: [:show, :edit, :update, :destroy]

  # GET /batches
  # GET /batches.json
  def index
    # Получаем список всех загруженных файлов
    @batches = Batch.all
  end

  # GET /batches/1
  # GET /batches/1.json
  def show
    # Используем умолчания Rails. Показываем стандартные поля объекта Batch
  end

  # GET /batches/new
  def new
    # Инициализируем новый объект Batch
    @batch = Batch.new
  end

  # GET /batches/1/edit
  def edit
    # Используем умолчания Rails для редактирования полей объекта Batch
  end

  # POST /batches
  # POST /batches.json
  def create
    # Сохраняем данные из загруженного файла
    # Инициализируем объект Batch с параметрами
    @batch = Batch.new(batch_params)
    # Загруженный файл
    uploaded_io = params[:batch][:batch_file]
    @file_path = "/public/uploads/#{uploaded_io.original_filename}"
    @xml_file = File.new(Rails.root.join('public', 'uploads', uploaded_io.original_filename))
    # Создаем новый документ XML. Выбираем интересующие нас элементы по имени/шаблону
    @xml_doc = Document.new(@xml_file)
    @root = @xml_doc.root
    @file_attribute_guid = @root.elements["FileAttribute/GUID"]
    # Берем содержимое ноды
    @batch.guid = @file_attribute_guid.text

    # Ищем загруженный файл в базе по GUID
    @existing_batch = Batch.find_batch_by_guid(@batch.guid)

    if @existing_batch != nil
      # Если файл существует, не сохраняем его данные
      @guid_error = "Batch file with GUID provided already exists in database"
    else
      # Файл не найден в базе, обрабатываем его данные
      @batch_id_data = @root.elements["FileData/Batch/BatchID"]
      @batch.batch_id = @batch_id_data.text
      @batch_creation_date_data = @root.elements["FileData/Batch/CreationDate"]
      @batch.creation_date = @batch_creation_date_data.text
      @batch.batch_file = @file_path
      # Сохраняем данные загруженного файла в базу
      @batch.save

      # Для каждой ноды "Invoice" внутри "FileData" сохраняем её данные в соответствующую таблицу БД
      @root.elements.each("FileData/Invoice") do |invoice|
        @invoice = @batch.invoices.create(
          invoice_operation_number: invoice.elements["InvoiceOperation/InvoiceOperationNumber"].text,
          invoice_operation_date: invoice.elements["InvoiceOperation/InvoiceOperationDate"].text,
          company_code: invoice.elements["InvoiceOperation/CompanyCode"].text,
          )
        # Сохраняем Инвойс
        @invoice.save
        # Теперь повторяем то же самое для каждого товара в инвойсе
        # Выбираем ноды "InvoiceData" внутрни инвойса и сохраняем их данные в таблицу invoice_data_items
        invoice.elements.each("InvoiceData") do |invoice_data_item|
          @invoice_data_item = @invoice.invoice_data_items.create(
            parcel_code: invoice_data_item.elements["ParcelCode"].text,
            item_qty: invoice_data_item.elements["ItemQty"].text,
            parcel_price: invoice_data_item.elements["ParcelPrice"].text,
            )
          # Сохраняем данные в БД
          @invoice_data_item.save
        end
      end
    end

    respond_to do |format|
      if @existing_batch != nil
        # Если файл с данным GUID уже существует в базе, возвращаемся к списку загрузок и выводим соответствующее предупреждение
        format.html { redirect_to batches_url, alert: @guid_error }
        format.json { head :no_content }
      else
        # Если сохранение объекта Batch прошло удачно, переходим на страницу показа и показываем соответствующее сообщение
        if @batch.save
          format.html { redirect_to @batch, notice: 'Batch was successfully uploaded.' }
          format.json { render :show, status: :created, location: @batch }
        else
          # В противном случае, остаемся на странице загрузки данных и показываем сообщение об ошибке
          format.html { render :new }
          format.json { render json: @batch.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /batches/1
  # PATCH/PUT /batches/1.json
  def update
    # При редактировании объекта Batch, используем уиолчания Rails
    respond_to do |format|
      if @batch.update(batch_params)
        format.html { redirect_to @batch, notice: 'Batch was successfully updated.' }
        format.json { render :show, status: :ok, location: @batch }
      else
        format.html { render :edit }
        format.json { render json: @batch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batches/1
  # DELETE /batches/1.json
  def destroy
    # При удалении объекта Batch из БД, используем уиолчания Rails
    @batch.destroy
    respond_to do |format|
      format.html { redirect_to batches_url, notice: 'Batch was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_batch
      # Находим данные объекта Batch по id
      @batch = Batch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def batch_params
      # Инициализация параметров объекта Batch
      params.require(:batch).permit(:batch_id, :creation_date, :guid, :batch_file)
    end
end
