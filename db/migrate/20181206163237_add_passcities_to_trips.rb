class AddPasscitiesToTrips < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :passcities, :string
  end
end
