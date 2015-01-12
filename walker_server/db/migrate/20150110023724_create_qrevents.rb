class CreateQrevents < ActiveRecord::Migration
  def change
    create_table :qrevents do |t|
      t.string :cord , :null => false
      t.integer :reward_id , :null => false

      t.timestamps
    end
  end
end
