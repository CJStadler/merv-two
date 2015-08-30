class CreateTableLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
        t.references :user
        t.string :name
        t.boolean :private, default: true
        t.integer :preferred_distance_unit_id

        t.index :user_id

        t.timestamps
    end
  end
end
