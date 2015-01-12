class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :stock_step,:null => false,:default => 0
      t.integer :total_step,:null => false,:default => 0

      t.timestamps
    end
  end
end
