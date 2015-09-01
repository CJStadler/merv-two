Rails.application.routes.draw do

    root "logs#index"

    resources :users
    resources :workouts
    resources :logs do
        get ":name", to: "logs#show", on: :collection # this should be default path for log
    end


    get "/login", to: "users#login"
    post "/authenticate", to: "users#authenticate"
    get "/logout", to: "users#logout"

    get "/console", to: "welcome#console"
end
