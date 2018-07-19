class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :origin
      t.string :destiny
      t.datetime :starting_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
