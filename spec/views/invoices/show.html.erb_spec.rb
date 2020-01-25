require 'rails_helper'

RSpec.describe "invoices/show", type: :view do
  before(:each) do
    @invoice = assign(:invoice, Invoice.create!(
      :invoice_operation_number => 2,
      :company_code => "Company Code",
      :batch => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Company Code/)
    expect(rendered).to match(//)
  end
end
