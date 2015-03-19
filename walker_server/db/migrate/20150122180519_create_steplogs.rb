class CreateSteplogs < ActiveRecord::Migration
  def change
    create_table :steplogs do |t|
      t.string :userhash, :null => false
      t.integer :step, :null => false

      t.timestamps
    end
  end
end
