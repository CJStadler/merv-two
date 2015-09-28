class WelcomeController < ApplicationController

    def console
        Workout.where("id > 0").nsum
    end

    def home
    end
end
