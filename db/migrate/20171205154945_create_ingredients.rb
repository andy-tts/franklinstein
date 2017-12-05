class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.decimal :cho
      t.decimal :pro
      t.decimal :fat
      t.integer :kcal
      t.string :category

      t.timestamps
    end
  end
end
