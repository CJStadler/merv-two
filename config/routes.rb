Rails.application.routes.draw do

    root "workouts#index"

    resources :workouts

    get "/console", to: "welcome#console"
end
