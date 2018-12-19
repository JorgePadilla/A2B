class CreateCosts < ActiveRecord::Migration[5.1]
  def change
    create_table :costs do |t|
      t.integer :seat
      t.decimal :cost
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end
