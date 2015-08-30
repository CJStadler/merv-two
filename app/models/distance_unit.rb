class DistanceUnit < ActiveRecord::Base

    validates :name, presence: true
    validate :in_unitwise

    def in_unitwise
        if Unitwise.search(name).blank?
            errors.add(:distance_unit, "invalid")
        end
    end

    def self.for_log(log)
        where("log_id IS NULL OR log_id = ?", log.id)
    end
end
