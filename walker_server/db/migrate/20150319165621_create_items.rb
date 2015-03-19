class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, :null => false
      t.integer :effective_term, :null => false
      t.integer :effective_value, :null => false
      t.string :description

      t.timestamps
    end
  end
end
