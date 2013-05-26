class CreateNewsstreams < ActiveRecord::Migration
  def change
    create_table :newsstreams do |t|
      t.string :url
      t.string :title
      t.references :user

      t.timestamps
    end
    add_index :newsstreams, :user_id
  end
end
