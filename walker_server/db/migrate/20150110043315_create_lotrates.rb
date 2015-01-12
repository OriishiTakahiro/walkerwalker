class CreateLotrates < ActiveRecord::Migration
  def change
    create_table :lotrates do |t|
      t.integer :table_id,:null => false
      t.integer :item_id,:null => false
      t.integer :probability,:null => false

      t.timestamps
    end
  end
end
