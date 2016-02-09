Rails.application.routes.draw do

  resources :requests
  root "requests#index"

  post "/requests/status/:id" => "requests#status", as: :status_update
  get "/requests/search" => "requests#search", as: :search
  
end
