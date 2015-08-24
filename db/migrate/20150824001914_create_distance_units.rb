class CreateDistanceUnits < ActiveRecord::Migration
  def change
    create_table :distance_units do |t|
        t.string :name
        t.string :abbreviation
        t.float :meters # how many meters in 1?
    end
  end
end
