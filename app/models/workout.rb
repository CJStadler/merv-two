class Workout < ActiveRecord::Base
    
    # Associations
    ##################################
    #belongs_to :log
    #belongs_to :shoe

    # Validations
    ##################################
    validates_presence_of :distance_unit, if: :distance?
    validate :distance_unit_correct, if: :distance?

    def distance_unit_correct
        if Unitwise.search(distance_unit).blank?
            errors.add(:distance_unit, "invalid")
        end
    end

    # Instance Methods
    ##################################

    def distance
        Unitwise(read_attribute(:distance), distance_unit)
    end

    def meters
        distance.to_meter.to_f
    end

    def pace
        # https://github.com/peleteiro/ruby-duration
    end

    # Class Methods
    ##################################

end
