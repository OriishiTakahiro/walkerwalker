class CreateGpsquests < ActiveRecord::Migration
  def change
    create_table :gpsquests do |t|
			t.string :name, :null => false, :unique => true
			t.string :description
      t.string :destination, :null => false
      t.decimal :latitude, :precision => 9, :scale => 6, :null => false
      t.decimal :longitude, :precision => 9, :scale => 6, :null => false
      t.string :reward, :null => false

      t.timestamps
    end
  end
end
