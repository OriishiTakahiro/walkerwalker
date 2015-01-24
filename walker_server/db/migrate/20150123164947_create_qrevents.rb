class CreateQrevents < ActiveRecord::Migration
  def change
    create_table :qrevents do |t|
      t.string :code
      t.integer :reward

      t.timestamps
    end
  end
end
