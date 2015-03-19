class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :null => false
      t.string :pass, :null => false
      t.string :userhash, :null => false

      t.timestamps
    end
  end
end
