class CreateStepUsers < ActiveRecord::Migration
  def change
    create_table :step_users do |t|
      t.integer :step_id, :null => false, :unique => true
      t.integer :user_id, :null => false, :unique => true

      t.timestamps
    end
  end
end
