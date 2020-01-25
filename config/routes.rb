Rails.application.routes.draw do
  resources :invoice_data_items
  resources :invoices
  resources :batches
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'batches#index'
  
end
