Rails.application.routes.draw do

    root "welcome#home"

    resources :users
    resources :logs, param: :name do
        resources :workouts
    end

    get "/login", to: "welcome#home"
    post "/authenticate", to: "users#authenticate"
    get "/logout", to: "users#logout"

    get "/console", to: "welcome#console"
end
