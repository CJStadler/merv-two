Rails.application.routes.draw do

    root "workouts#index"

    resources :workouts
    resources :logs
    resources :users do
        get 'login'
        post 'authenticate'
    end

    get "/console", to: "welcome#console"
end
