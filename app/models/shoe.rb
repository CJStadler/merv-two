class Shoe < ActiveRecord::Base

    # Associations
    #################################
    belongs_to :log
    has_many :workouts

    # Validations
    ##################################
    validates_presence_of :log_id, :name

    # Instance Methods
    ##################################

    # Return the total distance from all workouts
    # Do we need to specify the units on this?
    def distance
        d = Unitwise(0, log.preferred_distance_unit.name)

        if workouts.present?
            d = workouts.reduce(d) { |sum, w|
                sum + w.distance
            }
        end

        d
    end

    # Return the date of first use
    def first_used_on
        w = workouts.order("date ASC").first
        if w.present?
            w.date
        else
            nil
        end
    end

    def last_used_on
        w = workouts.order("date DESC").first
        if w.present?
            w.date
        else
            nil
        end
    end

    def summary
        "#{name}: #{distance.to_i}#{log.preferred_distance_unit.abbreviation}"
    end

end
