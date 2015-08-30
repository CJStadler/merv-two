class CreateDistanceUnits < ActiveRecord::Migration
  def change
    create_table :distance_units do |t|

        t.string :name
        t.string :abbreviation
        t.references :log

        t.index :name
    end
  end
end
