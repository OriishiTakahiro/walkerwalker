class CreateGpsquests < ActiveRecord::Migration
  def change
    create_table :gpsquests do |t|
      t.integer :flag
      t.string :not
      t.string :null
      t.string :destination
      t.string :not
      t.string :null
      t.integer :reward_table
      t.string :not
      t.string :null

      t.timestamps
    end
  end
end
