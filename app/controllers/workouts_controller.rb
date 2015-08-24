class WorkoutsController < ApplicationController

    def index
    end

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
        #@log = params[:log_id]
        #if current_user.owns(@log)
            @workout = Workout.new(workout_params)
            @workout.distance_unit = "mile"
            @workout.save
        #end
    end

    private

    def workout_params
        params.
            require(:workout).
            permit(
                :date,
                :duration,
                :distance,
                :distance_unit,
                :title,
                :details,
                :shoe_id
            )
    end

end
