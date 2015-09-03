Rails.application.routes.draw do

    root "users#login"

    resources :users
    resources :workouts
    resources :logs, param: :name

    get "/login", to: "users#login"
    post "/authenticate", to: "users#authenticate"
    get "/logout", to: "users#logout"

    get "/console", to: "welcome#console"
end
