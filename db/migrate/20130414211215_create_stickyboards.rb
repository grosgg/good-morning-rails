class CreateStickyboards < ActiveRecord::Migration
  def change
    create_table :stickyboards do |t|
      t.text :content
      t.timestamps
    end
  end
end
