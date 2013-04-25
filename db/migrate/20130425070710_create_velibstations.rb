class CreateVelibstations < ActiveRecord::Migration
  def change
    create_table :velibstations do |t|
      t.integer :velib_station_id
      t.string :title
      t.references :user

      t.timestamps
    end
    add_index :velibstations, :user_id
  end
end
