Rails.application.routes.draw do

  resources :deputados do
    member do
      get :fornecedores
    end
  end

  resources :deputados, only: [:show]
  get "up" => "rails/health#show", as: :rails_health_check
  root "deputados#index"
end
