module WorkoutsHelper

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

    private

    def get_first_of_week(date)
        date - (date.cwday - 1).days
    end
end
