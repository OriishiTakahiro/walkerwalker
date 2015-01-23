class CreateItemsUsers < ActiveRecord::Migration
  def change
    create_table :items_users do |t|
      t.integer :user_id
      t.integer :item_id

      t.timestamps
    end
  end
end
