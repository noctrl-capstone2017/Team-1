# Routes
# Team 1
# Author: Meagan Moore

Rails.application.routes.draw do
  root "login_session#new"
  
  get "teachers/:id/home",  to: 'teachers#home'

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

  resources :super
  get    '/super_report',    to: 'teachers#super_report'
  get    '/admin',    to: 'teachers#admin'
  #go back and make /super show the dashboard NOT /schools ... fix later.
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
