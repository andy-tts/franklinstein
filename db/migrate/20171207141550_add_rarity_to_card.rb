class AddRarityToCard < ActiveRecord::Migration[5.1]
  def change
  	add_column :cards, :rarity, :string
  end
end
