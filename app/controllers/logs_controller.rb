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

    def index
        redirect_to @current_user.logs.first
        # how to set default path for log?
    end

    private

    def public_or_current_user
        @log = Log.find_by_name(params[:name])
        if @log.private && @log.user != @current_user
            redirect_to "/"
        end
    end

end
