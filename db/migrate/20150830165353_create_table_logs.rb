class CreateTableLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
        t.references :user
        t.boolean :private, default: true
        t.string :preferred_distance_unit_id

        t.index :user_id

        t.timestamps
    end
  end
end
