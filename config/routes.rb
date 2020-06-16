Rails.application.routes.draw do
  root to: "items#index"
  devise_for :users
  resources :items
  resources :users, only: :show
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
