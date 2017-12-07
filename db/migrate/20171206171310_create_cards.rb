class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
    	t.string :name
    	t.string :mana_cost
    	t.integer :cmc
    	t.string :card_type
    	t.string :artist
    	t.string :img_url


    	t.timestamps
    end
  end
end