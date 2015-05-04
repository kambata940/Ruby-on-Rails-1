Rails.application.routes.draw do

  root 'posts#index'
  get '/new', to: 'posts#new'
  post '/new', to: 'posts#create'
  get '/:id', to: 'posts#show'
  delete '/:id', to: 'posts#destroy'

end