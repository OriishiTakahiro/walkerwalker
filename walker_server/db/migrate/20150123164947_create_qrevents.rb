class CreateQrevents < ActiveRecord::Migration
  def change
    create_table :qrevents do |t|
      t.string :code, :null => false, :unique => true
      t.string :reward, :null => false

      t.timestamps
    end
  end
end
