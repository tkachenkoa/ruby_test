require 'rails_helper'

RSpec.describe "invoices/index", type: :view do
  before(:each) do
    assign(:invoices, [
      Invoice.create!(
        :invoice_operation_number => 2,
        :company_code => "Company Code",
        :batch => nil
      ),
      Invoice.create!(
        :invoice_operation_number => 2,
        :company_code => "Company Code",
        :batch => nil
      )
    ])
  end

  it "renders a list of invoices" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Company Code".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
