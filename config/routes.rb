Rails.application.routes.draw do

  root   'static_pages#home'
  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact_us', to: 'static_pages#contact_us'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  get    '/coordinators', to: 'users#index'
  get    '/courses', to: 'courses#index'
  get    '/new_course', to: 'courses#new'
  get    '/courses_location', to: 'courses#locationfilter'
  get    '/courses_category', to: 'courses#categoryfilter'
  get    '/like', to: 'courses#like'
  get    '/new_category', to: 'categories#new'
  get    '/new_location', to: 'locations#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  get '/404', to: "error#not_found"
  get '/422', to: "error#unacceptable"
  get '/500', to: "error#server_errors"
  
  resources :users
  resources :courses
  resources :categories
  resources :locations
  
end
