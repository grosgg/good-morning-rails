class AddCountryAndTown < ActiveRecord::Migration
  def change
    add_column :users, :country, :string
    add_column :users, :town, :string
  end
end
