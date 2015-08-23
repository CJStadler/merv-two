class WorkoutsController < ApplicationController

    def show
        @workout = Workout.find(params[:id])
    end

    def new
        @workout = Workout.new

        if params[:date].present?
            @workout.date = params[:date]
        end
    end

    def create
        @log = params[:log_id]
        if current_user.owns(@log)
            @workout = Workout.new(params[:workout])
        end
    end

end
