class CreateQrlogs < ActiveRecord::Migration
  def change
    create_table :qrlogs do |t|
      t.string :userhash
      t.string :code

      t.timestamps
    end
  end
end
