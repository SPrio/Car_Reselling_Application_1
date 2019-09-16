Rails.application.routes.draw do
  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions", registrations: "admins/registrations" }
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions" }
  get 'home/index'
  get 'home/filter_search', to: 'home#filter_search'
  root to: 'home#index'
  get 'admins/index', to: 'admins#index' 
  resources :car_brands do
    resources :car_models
  end
  resources :car_cities
  resources :car_registration_states
  resources :car_variants
  resources :car_kilometer_drivens
  resources :car_registration_years
  resources :car_costs

  get 'users/index', to: 'users#index'
  
  resources :cars do 
    member do 
      get 'quotation'
      get 'appointment'
    end 
  end 
  resources :appointments do 
    member do 
      get 'details'
      get 'approve'
      get 'schedule'
      patch 'save_schedule'
    end
  end
  resources :notifications do
    collection do
      post 'mark_as_read'
    end
  end
  #get 'cars/quotation', to: 'cars#quotation'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
