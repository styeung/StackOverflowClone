Rails.application.routes.draw do
  resources :questions, only: [:index, :new, :create, :show, :destroy] do
    resources :answers, only: [:create, :destroy]
  end
  
  resources :answers, only:[] do
    resources :upvotes, only: [:create]
  end
  
  root to: "questions#index", as: "root"
  
end
