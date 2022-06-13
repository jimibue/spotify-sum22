Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    get '/artists', to: 'artists#index' # get all artist
    get '/artists/:id', to: 'artists#show' # get 1 artist
    post '/artists', to: 'artists#create' # create 1 artist
    put '/artists/:id', to: 'artists#update' # update 1 artist
    delete '/artists/:id', to: 'artists#destroy' # destroy 1 artist

    get '/artists/:artist_id/songs', to: 'songs#index'  # get all songs for a given artists
    get '/artists/:artist_id/songs/:id', to: 'songs#show'  # get 1 song for a given artists
    post '/artists/:artist_id/songs', to: 'songs#create'  # create 1 song for a given artists
    put '/artists/:artist_id/songs/:id', to: 'songs#update'  # update 1 song for a given artists
    delete '/artists/:artist_id/songs/:id', to: 'songs#destroy'  # destroy 1 song for a given artists

    get '/songs', to:  'songs#all_songs' # return all songs in db
    get '/everything', to:  'artists#everything' # return all songs in db
  
  end
end
