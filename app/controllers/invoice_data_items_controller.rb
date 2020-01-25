class InvoiceDataItemsController < ApplicationController
  before_action :set_invoice_data_item, only: [:show, :edit, :update, :destroy]

  # GET /invoice_data_items
  # GET /invoice_data_items.json
  def index
    @invoice_data_items = InvoiceDataItem.all
  end

  # GET /invoice_data_items/1
  # GET /invoice_data_items/1.json
  def show
  end

  # GET /invoice_data_items/new
  def new
    @invoice_data_item = InvoiceDataItem.new
  end

  # GET /invoice_data_items/1/edit
  def edit
  end

  # POST /invoice_data_items
  # POST /invoice_data_items.json
  def create
    @invoice_data_item = InvoiceDataItem.new(invoice_data_item_params)

    respond_to do |format|
      if @invoice_data_item.save
        format.html { redirect_to @invoice_data_item, notice: 'Invoice data item was successfully created.' }
        format.json { render :show, status: :created, location: @invoice_data_item }
      else
        format.html { render :new }
        format.json { render json: @invoice_data_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoice_data_items/1
  # PATCH/PUT /invoice_data_items/1.json
  def update
    respond_to do |format|
      if @invoice_data_item.update(invoice_data_item_params)
        format.html { redirect_to @invoice_data_item, notice: 'Invoice data item was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice_data_item }
      else
        format.html { render :edit }
        format.json { render json: @invoice_data_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoice_data_items/1
  # DELETE /invoice_data_items/1.json
  def destroy
    @invoice_data_item.destroy
    respond_to do |format|
      format.html { redirect_to invoice_data_items_url, notice: 'Invoice data item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice_data_item
      @invoice_data_item = InvoiceDataItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_data_item_params
      params.require(:invoice_data_item).permit(:parcel_code, :item_qty, :parcel_price, :invoice_id)
    end
end
