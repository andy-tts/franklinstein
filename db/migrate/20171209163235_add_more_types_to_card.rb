class AddMoreTypesToCard < ActiveRecord::Migration[5.1]
  def change
  	add_column :cards, :super_types, :string
  	add_column :cards, :basic_types, :string
  end
end
