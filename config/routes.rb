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
  resources :super
  get    '/super_report',    to: 'teachers#super_report'
  get    '/admin',    to: 'teachers#admin'
  #go back and make /super show the dashboard NOT /schools ... fix later.
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
