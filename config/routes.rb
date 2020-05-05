Rails.application.routes.draw do

  resources :ruby_mines
  resources :vs_codes
  # root to: "vs_codes#index"
  root to: "ruby_mines#index"
end
