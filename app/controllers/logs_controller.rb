class LogsController < ApplicationController

    before_action :public_or_current_user, only: :show

    def show
        @log = Log.find_by_name(params[:name])

        # how many months to show
        if params[:n_months].present?
            @n_months = params[:n_months].to_i
        else
            @n_months = 6
        end

        # month to focus
        if params[:month].present?
            month = params[:month].to_i
        else
            month = Date.today.month
        end

        # year to start with
        if params[:year].present?
            year = params[:year].to_i
        else
            year = Date.today.year
        end

        @focus_day = Date.new(year, month)
        @start_day = @focus_day - (@n_months/2).months
    end

    def index
        if params[:log][:name].present?
            log = Log.find_by_name(params[:log][:name])
            if log.present?
                redirect_to log
            else
                redirect_to :back
            end
        else
            redirect_to @current_user.logs.first
        end
    end

    def summary
        @log = Log.find_by_name(params[:name])
        if params[:first_of_week].present?
            @start_date = Date.parse(params[:first_of_week])
            @end_date = @start_date + 6.days
            @workouts = @log.workouts.by_week(@start_date)
        elsif params[:month].present? && params[:year].present?
            @start_date = Date.new(params[:year].to_i, params[:month].to_i)
            @end_date = @start_date.end_of_month
            @workouts = @log.workouts.by_month(params[:month], params[:year])
        end
    end

    private

    def public_or_current_user
        @log = Log.find_by_name(params[:name])
        if @log.private && @log.user != @current_user
            redirect_to "/"
        end
    end

end
