class ShoesController < ApplicationController

    def index
        @log = Log.find_by_name(params[:log_name])
        @shoes = @log.shoes

        if @log.user_id == @current_user.id
            @shoes << Shoe.new
            render :form
        else
            render :index
        end
    end

    # This creates and updates shoes
    def create
        @log = Log.find_by_name(params[:log_name])

        Shoe.transaction do
            params[:shoes].each do |input|
                if input[:id].present?
                    shoe = @log.shoes.find_by_id(input[:id])
                elsif input[:name].present?
                    # new shoe
                    shoe = Shoe.new
                    shoe.log = @log
                end

                if shoe.present?
                    shoe.name = input[:name]

                    shoe.save!
                end
            end
        end

        # success
        redirect_to log_shoes_path(@log)

    rescue ActiveRecord::RecordInvalid => e
        # handle failure

    end

end
