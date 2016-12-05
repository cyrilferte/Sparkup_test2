Rails.application.routes.draw do
    resources :importations, only: [:index, :new, :create, :show]
resources :contacts
  root "importations#new"
end
