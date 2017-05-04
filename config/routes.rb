Rails.application.routes.draw do
  root "login_session#new"
  
  get "teachers/home"
  resources :roster_students
  resources :roster_squares
  resources :session_events
  resources :sessions
  resources :squares
  resources :students
  resources :teachers
  resources :schools
  resources :login_session
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
