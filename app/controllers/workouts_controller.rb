class WorkoutsController < ApplicationController

    def index
        # how many months to show
        if params[:n_months].present?
            @n_months = params[:n_months].to_i
        else
            @n_months = 6
        end

        # month to start with
        if params[:month].present?
            @month = params[:month].to_i
        else
            @month = Date.today.month
        end

        # year to start with
        if params[:year].present?
            @year = params[:year].to_i
        else
            @year = Date.today.year
        end
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
            @workout.distance_unit = DistanceUnit.find_by_name("mile")
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
                :distance_unit_id,
                :title,
                :details,
                :shoe_id
            )
    end

end
