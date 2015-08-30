class Workout < ActiveRecord::Base

    # Associations
    ##################################
    belongs_to :distance_unit
    belongs_to :log
    #belongs_to :shoe

    # Validations
    ##################################
    validates_presence_of :distance_unit_id, if: :distance?
    validate :distance_unit_in_log, if: :distance?

    # the unit used must be public or owned by the log
    def distance_unit_in_log
        if distance_unit.log_id.present? && distance_unit.log_id != log_id
            errors.add(:distance_unit_id, "must be owned by this log.")
        end
    end

    # Instance Methods
    ##################################

    def distance
        Unitwise(read_attribute(:distance), distance_unit.name)
    end

    def summary
        "#{distance.to_i}#{distance_unit.abbreviation}. #{title}"
    end

    def meters
        distance.to_meter.to_f
    end

    def pace
        # https://github.com/peleteiro/ruby-duration
    end

    # Class Methods
    ##################################

    # Scopes

    def self.by_date(date)
        where(date: date)
    end

    def self.by_month(month, year)
        by_year(year).
            where("extract(month from date) = ?", month)
    end

    def self.by_year(year)
        where("extract(year from date) = ?", year)
    end

    def self.by_week(first_of_week)
        where("date >= ? AND date <= ?", first_of_week, first_of_week + 6.days)
    end

end
