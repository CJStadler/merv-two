class ChangeWorkoutsDistanceUnitToInteger < ActiveRecord::Migration
  def up
      remove_column :workouts, :distance_unit
      add_column :workouts, :distance_unit_id, :integer
  end

  def down
      remove_column :workouts, :distance_unit_id
      add_column :workouts, :distance_unit, :string
  end
end
