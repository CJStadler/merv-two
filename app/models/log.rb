class Log < ActiveRecord::Base

    # Associations
    #################################
    has_many :workouts
    belongs_to :user
    belongs_to :preferred_distance_unit, class_name: 'DistanceUnit'

    # Instance Variables
    ###################################
    def public
        ! self.private
    end

end
