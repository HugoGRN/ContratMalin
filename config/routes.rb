Rails.application.routes.draw do
  resources :contrats
  resources :information
  devise_for :users

  get 'contrats/:id/remplacement', to: 'contrats#remplacement', as: 'remplacement_contrat'
  get 'contrats/:id/assistanat', to: 'contrats#assistanat', as: 'assistanat_contrat'
  get 'contrats/:id/collaboration', to: 'contrats#collaboration', as: 'collaboration_contrat'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'publics#home'
end
