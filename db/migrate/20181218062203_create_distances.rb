class CreateDistances < ActiveRecord::Migration[5.1]
  def change
    create_table :distances do |t|
      t.references :origin_city
      t.references :destiny_city
      t.integer :km
      t.decimal :price

      t.timestamps
    end
  end
end
