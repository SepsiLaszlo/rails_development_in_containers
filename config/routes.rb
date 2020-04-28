Rails.application.routes.draw do

  resources :ruby_mines
  root to: "ruby_mines#index"
end
