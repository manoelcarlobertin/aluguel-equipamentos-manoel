Rails.application.routes.draw do
  # Rotas do Devise para autenticação de usuários
  devise_for :users

  # Definir a rota para welcome#index
  get "welcome", to: "welcome#index"

  # Definir as rotas para customers usando resources e
  # # facilitador de buscas: a gem Ransack collection """
  resources :customers do
    collection do
      get :search
    end
  end

  resources :equipaments do
    collection do
      get :search
    end
  end

  resources :orders

  # Se você precisar de uma rota específica, pode ser:
  # get "customers", to: "customers#index"

  # Defines the root path route ("/")
  root "welcome#index"
  # root "customers#index"
end
