class WorkoutsController < ApplicationController

    def index
        # for search
        @log = Log.find_by_name(params[:log_name])
        @workouts = @log.workouts

        @workouts = @workouts.text_search(params[:text_search]) if params[:text_search].present?
    end

    def show
        @workout = Workout.find(params[:id])
    end

    def new
        @log = Log.find_by_name(params[:log_name])
        @workout = Workout.new

        most_recent_workout = @log.workouts.order("date DESC").limit(1).first
        if most_recent_workout.present?
            @shoe = most_recent_workout.shoe
        else
            @shoe = nil
        end

        if params[:date].present?
            @workout.date = params[:date]
        end
    end

    def create
        #if current_user.owns(@log)
            @workout = Workout.new(workout_params)
            @workout.log_id = 1
            @workout.distance_unit = DistanceUnit.find_by_name("mile")
            @workout.save
        #end

        redirect_to "/"
    end

    private

    def workout_params
        params.
            require(:workout).
            permit(
                :date,
                :duration,
                :distance,
                :distance_unit_id,
                :title,
                :details,
                :shoe_id
            )
    end

end
