class Log < ActiveRecord::Base

    # Associations
    #################################
    has_many :workouts
    has_many :shoes
    belongs_to :user
    belongs_to :preferred_distance_unit, class_name: 'DistanceUnit'

    # Validations
    ##################################
    validates_presence_of :name, :user_id, :preferred_distance_unit_id
    validates_uniqueness_of :name

    # Instance Variables
    ###################################

    # use the name instead of the id when generating the path
    def to_param
        name
    end

    def public
        ! self.private
    end

    # Callbacks
    ###################################

    after_initialize :set_defaults

    def set_defaults
        preferred_distance_unit ||= DistanceUnit.find_by_name("mile")
    end

end
