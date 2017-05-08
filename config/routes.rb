# Routes
# Team 1
# Author: Meagan Moore

Rails.application.routes.draw do
  root "login_session#new"
  
  resources :roster_students
  resources :roster_squares
  resources :session_events
  resources :sessions
  resources :squares
  resources :students
  resources :teachers
  resources :schools
  resources :login_session
  
  get    'login'   => 'login_session#new'
  post   'login'   => 'login_session#create'
  
  get    'logout'  => 'login_session#logout'
  
  get    'about1'  => 'static_pages#about1'
  get    'about2'  => 'static_pages#about2'
  
  get    'home1'   => 'static_pages#home1'
  post   'home1'   => 'static_pages#home1'

end
