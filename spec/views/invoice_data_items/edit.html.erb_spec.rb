require 'rails_helper'

RSpec.describe "invoice_data_items/edit", type: :view do
  before(:each) do
    @invoice_data_item = assign(:invoice_data_item, InvoiceDataItem.create!(
      :parcel_code => 1,
      :item_qty => 1,
      :parcel_price => 1,
      :invoice => nil
    ))
  end

  it "renders the edit invoice_data_item form" do
    render

    assert_select "form[action=?][method=?]", invoice_data_item_path(@invoice_data_item), "post" do

      assert_select "input[name=?]", "invoice_data_item[parcel_code]"

      assert_select "input[name=?]", "invoice_data_item[item_qty]"

      assert_select "input[name=?]", "invoice_data_item[parcel_price]"

      assert_select "input[name=?]", "invoice_data_item[invoice_id]"
    end
  end
end
