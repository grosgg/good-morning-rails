class CreateWeatherkeys < ActiveRecord::Migration
  def change
    create_table :weatherkeys do |t|
      t.string :api_key
      t.references :user
      t.timestamps
    end
  end
end
