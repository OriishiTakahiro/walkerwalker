class CreateStepUsers < ActiveRecord::Migration
  def change
    create_table :step_users do |t|
      t.integer :step_id
      t.integer :user_id

      t.timestamps
    end
  end
end
