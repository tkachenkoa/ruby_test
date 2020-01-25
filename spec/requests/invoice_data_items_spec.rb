require 'rails_helper'

RSpec.describe "InvoiceDataItems", type: :request do
  describe "GET /invoice_data_items" do
    it "works! (now write some real specs)" do
      get invoice_data_items_path
      expect(response).to have_http_status(200)
    end
  end
end
