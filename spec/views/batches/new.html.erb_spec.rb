require 'rails_helper'

RSpec.describe "batches/new", type: :view do
  before(:each) do
    assign(:batch, Batch.new(
      :batch_id => 1,
      :guid => "MyString"
    ))
  end

  it "renders new batch form" do
    render

    assert_select "form[action=?][method=?]", batches_path, "post" do

      assert_select "input[name=?]", "batch[batch_id]"

      assert_select "input[name=?]", "batch[guid]"
    end
  end
end
