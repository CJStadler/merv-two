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

    private

    def public_or_current_user
        @log = Log.find_by_name(params[:name])
        if @log.private && @log.user != @current_user
            redirect_to "/"
        end
    end

end
