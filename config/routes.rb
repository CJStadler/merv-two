Rails.application.routes.draw do

    root "workouts#index"

    resources :workouts
    resources :logs
    resources :users

    get "/login", to: "users#login"
    post "/authenticate", to: "users#authenticate"
    get "/logout", to: "users#logout"

    get "/console", to: "welcome#console"
end
