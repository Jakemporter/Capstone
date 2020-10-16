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
    get "/bids/:id" => "bids#show"
    post "/bids" => "bids#create"
    
    #Category
    post "/categories" => "categories#create"

    #comments
    post "/comments" => "comments#create"
  end
end
