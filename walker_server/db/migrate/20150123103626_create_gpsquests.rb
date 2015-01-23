class CreateGpsquests < ActiveRecord::Migration
  def change
    create_table :gpsquests do |t|
      t.string :destination
      t.float :longitude
      t.float :latitude
      t.integer :reward

      t.timestamps
    end
  end
end
