require 'rails_helper'

RSpec.describe "batches/edit", type: :view do
  before(:each) do
    @batch = assign(:batch, Batch.create!(
      :batch_id => 1,
      :guid => "MyString"
    ))
  end

  it "renders the edit batch form" do
    render

    assert_select "form[action=?][method=?]", batch_path(@batch), "post" do

      assert_select "input[name=?]", "batch[batch_id]"

      assert_select "input[name=?]", "batch[guid]"
    end
  end
end
