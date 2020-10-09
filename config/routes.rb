Rails.application.routes.draw do


  namespace :api do
    #Users
    post "/users" => "users#create"
    #Login
    post "/sessions" => "sessions#create"
    #Cars
    

  end
end
