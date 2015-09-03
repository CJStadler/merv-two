class Log < ActiveRecord::Base

    # Associations
    #################################
    has_many :workouts
    belongs_to :user
    belongs_to :preferred_distance_unit, class_name: 'DistanceUnit'

    # Instance Variables
    ###################################

    # use the name instead of the id when generating the path
    def to_param
        name
    end

    def public
        ! self.private
    end

end
