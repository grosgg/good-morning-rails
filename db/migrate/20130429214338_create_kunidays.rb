class CreateKunidays < ActiveRecord::Migration
  def change
    create_table :kunidays do |t|
      t.date :date
      t.integer :weekday
      t.integer :week
      t.integer :year
      t.string :am
      t.string :pm
      t.string :comment
      t.timestamps
    end
  end
end
