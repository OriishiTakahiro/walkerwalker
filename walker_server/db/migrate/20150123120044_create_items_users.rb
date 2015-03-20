class CreateItemsUsers < ActiveRecord::Migration
  def change
    create_table :items_users do |t|
      t.integer :user_id, :null => false
      t.integer :item_id, :null => false
			t.integer :amount, :null => false

      t.timestamps
    end
  end
end
