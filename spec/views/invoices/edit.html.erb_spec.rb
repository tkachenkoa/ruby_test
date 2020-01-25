require 'rails_helper'

RSpec.describe "invoices/edit", type: :view do
  before(:each) do
    @invoice = assign(:invoice, Invoice.create!(
      :invoice_operation_number => 1,
      :company_code => "MyString",
      :batch => nil
    ))
  end

  it "renders the edit invoice form" do
    render

    assert_select "form[action=?][method=?]", invoice_path(@invoice), "post" do

      assert_select "input[name=?]", "invoice[invoice_operation_number]"

      assert_select "input[name=?]", "invoice[company_code]"

      assert_select "input[name=?]", "invoice[batch_id]"
    end
  end
end
