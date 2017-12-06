class CreateDogs < ActiveRecord::Migration[5.1]
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :age
      t.string :breed
      t.integer :weight
      t.string :health_status

      t.timestamps
    end
  end
end
