module LogsHelper

    # Helpers for calendar view
    #####################################
    def days_of_week
        ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    end

    def each_week(first_of_month)
        first_of_week = get_first_of_week(first_of_month)

        loop do
            # yield first_of_week to block
            yield(first_of_week)
            first_of_week += 7.days
            break if (first_of_week.month != first_of_month.month)
        end
    end

    def each_day(first_of_week)
        7.times do |i|
            day = first_of_week + i.days
            # yield day to block
            yield(day)
        end
    end

    def month_name(date)
        date.strftime("%B")
    end

    def sum_workouts(workouts, unit)
        workouts.reduce(0) { |sum, w|
            sum + w.distance.convert_to(unit.name).to_f
        }
    end

    private

    def get_first_of_week(date)
        date - (date.cwday - 1).days
    end
end
