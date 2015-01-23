class CreateGpslogs < ActiveRecord::Migration
  def change
    create_table :gpslogs do |t|
      t.string :userhash
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
