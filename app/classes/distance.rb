# Represents a distance
class Distance

    def new(quantity, unit)
        @quantity, @unit = quantity, unit
    end

    # d.convert_to(DistanceUnit.find_by_name("mile"))    => 2
    # d.convert_to(DistanceUnit.find_by_name("meter"))    => 3218
    def convert_to(unit)
        (@quantity.to_f/unit.meters)*@unit.meters
    end

    # convenience methods for converting units
    # e.g.
    #     d.miles     => 2
    #     d.meters    => 3218
    DistanceUnit.all.each do |unit|
        define_method unit.name.pluralize.to_sym do |unit|
            convert_to(unit)
        end
    end

end
