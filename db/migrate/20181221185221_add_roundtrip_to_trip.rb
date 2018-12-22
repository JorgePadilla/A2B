class AddRoundtripToTrip < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :roundtrip, :boolean
    add_column :trips, :confirm, :boolean
  end
end
