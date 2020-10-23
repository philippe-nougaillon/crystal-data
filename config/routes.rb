Rails.application.routes.draw do

  resources :users
  resources :tables
  resources :values

  resources :fields do
    post :update_row_order, on: :collection
  end

  namespace :api, defaults: {format: :json}  do
    namespace :v1 do
      get 'timestamps', to: 'users#timestamps'
      post 'values/post_value'
      resources :users 
      resources :tables
      resources :fields
      resources :values
    end
  end

  get 'tables/:id/fill' => 'tables#fill', as: :fill
  post 'tables/:id/fill' => 'tables#fill_do', as: :fill_do
  delete 'tables/:id/delete_record' => 'tables#delete_record', as: :delete_record
  get "show_attrs" => "tables#show_attrs" 

  get '/import', to: 'tables#import'
  post '/import_do', to: 'tables#import_do'

  get 'tables/:id/add_user', to:'tables#add_user', as: :add_user
  post '/add_user_do', to:'tables#add_user_do'
  get 'tables/:id/partages', to:'tables#partages', as: :partages
  get 'tables/:id/partages_delete', to:'tables#partages_delete', as: :annuler_partage
  get 'tables/:id/export', to: 'tables#export', as: :export
  post '/export_do', to: 'tables#export_do'
  get 'tables/:id/logs', to: 'tables#logs', as: :logs
  get 'tables/:id/activity', to: 'tables#activity', as: :activity

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/about' => 'sessions#welcome'
  get '/demo' => 'sessions#demo'

  get 'values/signature', to: 'values#signature'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'tables#index'
end
