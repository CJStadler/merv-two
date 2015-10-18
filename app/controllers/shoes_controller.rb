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

    def create
        @log = Log.find_by_name(params[:log_name])
        @shoes = @log.shoes
        # TODO: Should iterate through these and update them + create new

        begin
            params[:shoes].each do |input|
                if input[:id].present?
                    shoe = Shoe.find(input[:id])
                else
                    shoe = Shoe.new
                    shoe.log = @log
                end

                shoe.name = input[:name]

                shoe.save!
                @shoes << shoe
            end

            @shoes << Shoe.new

        rescue ActiveRecord::RecordInvalid => e
            # handle failure
        end

        render :form
    end

end
