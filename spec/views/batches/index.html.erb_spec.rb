require 'rails_helper'

RSpec.describe "batches/index", type: :view do
  before(:each) do
    assign(:batches, [
      Batch.create!(
        :batch_id => 2,
        :guid => "Guid"
      ),
      Batch.create!(
        :batch_id => 2,
        :guid => "Guid"
      )
    ])
  end

  it "renders a list of batches" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Guid".to_s, :count => 2
  end
end
