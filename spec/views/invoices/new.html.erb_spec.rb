require 'rails_helper'

RSpec.describe "invoices/new", type: :view do
  before(:each) do
    assign(:invoice, Invoice.new(
      :invoice_operation_number => 1,
      :company_code => "MyString",
      :batch => nil
    ))
  end

  it "renders new invoice form" do
    render

    assert_select "form[action=?][method=?]", invoices_path, "post" do

      assert_select "input[name=?]", "invoice[invoice_operation_number]"

      assert_select "input[name=?]", "invoice[company_code]"

      assert_select "input[name=?]", "invoice[batch_id]"
    end
  end
end
