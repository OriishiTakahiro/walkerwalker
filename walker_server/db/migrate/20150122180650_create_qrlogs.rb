class CreateQrlogs < ActiveRecord::Migration
  def change
    create_table :qrlogs do |t|
      t.string :userhash, :null => false
      t.string :code, :null => false

      t.timestamps
    end
  end
end
