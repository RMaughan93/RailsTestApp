Rails.application.routes.draw do

  
  root "demo#index"
  get 'admin', :to => "access#index"
  #get 'demo/index'
  match ':controller(/:action(/:id))', :via => [:get, :post]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'access/index'
  get 'access/login'
  get 'section/index'
  get 'section/show'
  get 'section/new'
  get 'section/create'
  get 'section/edit'
  get 'section/update'
  get 'section/delete'
  get 'section/destroy'
  get 'pages/index'
  get 'pages/show'
  get 'pages/new'
  get 'pages/create'
  get 'pages/edit'
  get 'pages/update'
  get 'pages/delete'
  get 'pages/destroy'
  
end
