class CreateGpsquests < ActiveRecord::Migration
  def change
    create_table :gpsquests do |t|
      t.integer :flag,:null => false
      t.integer :lot_table,:null => false
      t.string :destination_latitude,:null => false
      t.string :destination_longitude,:null => false

      t.timestamps
    end
  end
end
