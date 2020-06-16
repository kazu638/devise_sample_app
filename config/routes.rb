Rails.application.routes.draw do
  root to: "items#index"
  devise_for :users
  resources :users, only: [:show]
  resources :items
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
