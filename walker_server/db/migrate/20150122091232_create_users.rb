class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :pass
      t.string :userhash

      t.timestamps
    end
  end
end
