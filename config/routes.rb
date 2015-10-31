Rails.application.routes.draw do

  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  get 'password_resets/new'

  get 'password_resets/edit'

  root 'static_pages#home'

  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'timetable' => 'static_pages#timetable'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'


  resources :account_activations, only: [:edit]
  resources :users # NEW LINE
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :projects
  resources :timetables, only: [:index, :new, :create, :destroy]



end
