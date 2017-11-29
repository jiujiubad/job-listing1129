Rails.application.routes.draw do
  devise_for :users
  root "welcome#index"

  resources :jobs do
    resources :resumes
  end

  namespace :admin do
    resources :jobs do
      member do
        post :hide
        post :publish
      end
      resources :resumes
    end
  end
end
