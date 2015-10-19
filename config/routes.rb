Rails.application.routes.draw do

    root "welcome#home"

    resources :users
    resources :logs, param: :name do
        member do
            get 'summary'
        end
        resources :workouts
        resources :shoes
    end

    get "/login", to: "welcome#home", as: "login"
    post "/authenticate", to: "users#authenticate"
    get "/logout", to: "users#logout", as: "logout"

    get "/console", to: "welcome#console"
end
