Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails, as: 'cocktails', only: [:new, :create, :show, :index] do
    resources :doses, as: 'doses', only: [:new, :index, :create ]
  end
  resources :doses, only: [:destroy]
end
