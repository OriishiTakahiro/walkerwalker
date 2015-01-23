class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :stock_step
      t.integer :total_step

      t.timestamps
    end
  end
end
