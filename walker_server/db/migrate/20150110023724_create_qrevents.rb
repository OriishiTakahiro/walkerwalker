class CreateQrevents < ActiveRecord::Migration
  def change
    create_table :qrevents do |t|
      t.string :code , :null => false
      t.integer :reward_id , :null => false

      t.timestamps
    end
  end
end
