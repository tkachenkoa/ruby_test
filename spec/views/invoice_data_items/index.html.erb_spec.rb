require 'rails_helper'

RSpec.describe "invoice_data_items/index", type: :view do
  before(:each) do
    assign(:invoice_data_items, [
      InvoiceDataItem.create!(
        :parcel_code => 2,
        :item_qty => 3,
        :parcel_price => 4,
        :invoice => nil
      ),
      InvoiceDataItem.create!(
        :parcel_code => 2,
        :item_qty => 3,
        :parcel_price => 4,
        :invoice => nil
      )
    ])
  end

  it "renders a list of invoice_data_items" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
