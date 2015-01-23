class CreateSteplogs < ActiveRecord::Migration
  def change
    create_table :steplogs do |t|
      t.string :userhash
      t.integer :step

      t.timestamps
    end
  end
end
