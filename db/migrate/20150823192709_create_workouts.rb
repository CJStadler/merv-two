class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
        t.date :date
        t.float :distance
        t.string :distance_unit
        t.float :duration # in seconds
        t.string :title
        t.text :details
        t.references :shoe
        t.references :log

        t.timestamps
    end
  end
end
