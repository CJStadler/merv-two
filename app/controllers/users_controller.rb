class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            @log = Log.new(log_params)
            @log.user = @user
            @log.save
            redirect_to "/"
        else
            redirect_to new_user_path
        end
    end

    def authenticate
        @user = User.find_by_name(user_params[:name])

        if @user.present? && @user.authenticate(user_params[:password])
            session[:user_id] = @user.id
            redirect_to @user.log
        else
            redirect_to "/"
        end
    end

    def logout
        reset_session
        redirect_to "/"
    end

    private

    def user_params
        params.
            require(:user).
            permit(
                :name,
                :password,
                :password_confirmation
            )
    end

    def log_params
        params.
            require(:log).
            permit(
                :name,
                :preferred_distance_unit_id
            )
    end
end
