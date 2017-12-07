class AddSetNameAndOthersColumnsToCard < ActiveRecord::Migration[5.1]
  def change
  	add_column :cards, :set_name, :string
  	add_column :cards, :color_identity, :string
  	add_column :cards, :legalities, :string
  	add_column :cards, :sub_types, :string
  end
end
