class Workout < ActiveRecord::Base

    # Associations
    ##################################
    #belongs_to :log
    #belongs_to :shoe
    belongs_to :distance_unit

    # Validations
    ##################################

    # Instance Methods
    ##################################

    # convert distance to meters
    def meters


    # Class Methods
    ##################################

end
