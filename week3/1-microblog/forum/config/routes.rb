Rails.application.routes.draw do

  resources :posts
  resources :comments
  root 'posts#index'
  get '/new', to: 'posts#new'
  get '/posts/:post_id/new_comment/', to: 'comments#new'
  get '/profile', to: 'application#profile'
  get '/sign_in', to: 'users#new', layout: 'sign_in_layout'

end
