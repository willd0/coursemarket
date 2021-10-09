Rails.application.routes.draw do
  devise_for :users
  resources :courses do
    resources :sections do
      resources :lessons
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root 'home#index'
  root 'courses#index'
end
