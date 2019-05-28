Rails.application.routes.draw do

  root   'static_pages#home'
  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  get    '/coordinators', to: 'users#index'
  get    '/courses', to: 'courses#index'
  get    '/new_course', to: 'courses#new'
  get    '/courses_location', to: 'courses#locationfilter'
  get    '/courses_category', to: 'courses#categoryfilter'
  get    '/new_category', to: 'categories#new'
  get    '/new_location', to: 'locations#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :users
  resources :courses
  resources :categories
  resources :locations
  
end
