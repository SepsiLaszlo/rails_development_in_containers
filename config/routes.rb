Rails.application.routes.draw do

  resources :vs_codes
  resources :ruby_mines
  root to: "ruby_mines#index"
end
