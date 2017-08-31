class CreateRounds < ActiveRecord::Migration[5.1]
  def change
    create_table :rounds do |t|
    	t.integer :round_number
    	t.boolean :open, default: false

      t.timestamps
    end
  end
end
