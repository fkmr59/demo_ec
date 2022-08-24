Rails.application.routes.draw do
  
  post 'tests/pay' => 'tests#pay'
  #post '/pay', to: 'pays#pay'
  get 'tests/index' => 'tests#index'
  
  get 'addresses/:id/new' => 'addresses#new'
  post 'addresses/:id/create' => 'addresses#create'
  get 'orders/:id/new' => 'orders#new'
  get 'orders/show' => 'orders#show'
  post 'orders/:id/create' => 'orders#create'
  
  get 'carts/index' => 'carts#index'
  get 'carts/:id/new' => 'carts#new'
  post 'carts/:id/create' => 'carts#create'
  
  get 'carts/:id/edit' => 'carts#edit'
  post 'carts/:id/update' => 'carts#update'
  post 'carts/:id/destroy' => 'carts#destroy'
  
  post 'likes/:item_id/create' => 'likes#create'
  post 'likes/:item_id/destroy' => 'likes#destroy'
  
  get 'items/index' => 'items#index'
  get 'items/new' => 'items#new'
  get 'items/:id' => 'items#show'
  post 'items/create' => 'items#create'
  
  get 'items/:id/edit' => 'items#edit'
  post 'items/:id/update' => 'items#update'
  post 'items/:id/destroy' => 'items#destroy'
  
  post 'users/:id/update' => 'users#update'
  get 'users/:id/edit' => 'users#edit'
  post 'users/create' => 'users#create'
  get 'signup' => 'users#new'
  get 'users/index' => 'users#index'
  get 'users/:id' => 'users#show'
  post 'login' => 'users#login'
  post 'logout' => 'users#logout'
  get 'login' => 'users#login_form'
  get 'users/:id/likes' => 'users#likes'
  
  get '/' => 'home#top'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
