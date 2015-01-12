class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name,:null => false,:unique => true
      t.string :pass,:null => false
			t.string :userhash,:null => false,:unique => true
      t.string :stock_item,:null => false,:default => ""
      t.string :step_id,:null => false

      t.timestamps
    end
  end
end
