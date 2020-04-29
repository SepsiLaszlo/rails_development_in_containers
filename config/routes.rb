Rails.application.routes.draw do

  resources :vs_codes
  resources :ruby_mines
  root to: "vs_codes#index"
end
