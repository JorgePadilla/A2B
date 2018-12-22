class CreateVariables < ActiveRecord::Migration[5.1]
  def change
    create_table :variables do |t|
      t.decimal :gasperkm

      t.timestamps
    end
  end
end
