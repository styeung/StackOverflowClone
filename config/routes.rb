Rails.application.routes.draw do
  resources :questions, only: [:index, :new, :create, :show, :destroy] do
    resources :answers, only: [:create, :destroy]
  end
  
end
