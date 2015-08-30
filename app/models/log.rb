class Log < ActiveRecord::Base

    # Associations
    #################################
    has_many :workouts
    belongs_to :preferred_distance_unit, class_name: 'DistanceUnit'

end
