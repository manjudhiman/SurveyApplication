Rails.application.routes.draw do
  resources :surveys do
    collection do
      get 'list'
    end
  end
  resources :questions do
    resources :answers
  end

  get 'home/index'
  devise_for :users
  root to: 'surveys#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
