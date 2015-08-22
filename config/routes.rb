Rails.application.routes.draw do
  devise_for :users
  root "projects#index"
  resources :projects do
    resources :project_items, only: %i(new create update destroy)
  end
end
