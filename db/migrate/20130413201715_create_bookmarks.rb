class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :title
      t.string :url
      t.text :description
      t.references :user

      t.timestamps
    end
    add_index :bookmarks, :user_id
  end
end
