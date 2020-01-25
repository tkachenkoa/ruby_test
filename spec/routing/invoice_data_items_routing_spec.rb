require "rails_helper"

RSpec.describe InvoiceDataItemsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/invoice_data_items").to route_to("invoice_data_items#index")
    end

    it "routes to #new" do
      expect(:get => "/invoice_data_items/new").to route_to("invoice_data_items#new")
    end

    it "routes to #show" do
      expect(:get => "/invoice_data_items/1").to route_to("invoice_data_items#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/invoice_data_items/1/edit").to route_to("invoice_data_items#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/invoice_data_items").to route_to("invoice_data_items#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/invoice_data_items/1").to route_to("invoice_data_items#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/invoice_data_items/1").to route_to("invoice_data_items#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/invoice_data_items/1").to route_to("invoice_data_items#destroy", :id => "1")
    end
  end
end
