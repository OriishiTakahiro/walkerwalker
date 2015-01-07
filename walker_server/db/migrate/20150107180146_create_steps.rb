class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|

      t.string :userhash , :null => false
      t.integer :step , :null => false , :default => 0
      t.integer :total_step , :null => false , :default => 0

      t.timestamps
    end
  end
end
