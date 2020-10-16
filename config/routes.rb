Rails.application.routes.draw do


  namespace :api do
    #Users
    post "/users" => "users#create"
    get "/users" => "users#index"

    #Login
    post "/sessions" => "sessions#create"

    #Cars
    get "/cars" => "cars#index"
    get "/cars/:id" => "cars#show"
    post "/cars" => "cars#create"
    patch "cars/:id" => "cars#update"
    delete "cars/:id" => "cars#destroy"

    #Bids
    post "/bids/:id" => "bids#show"
    
  end
end
