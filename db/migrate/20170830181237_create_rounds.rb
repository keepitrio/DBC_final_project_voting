class CreateRounds < ActiveRecord::Migration[5.1]
  def change
    create_table :rounds do |t|
    	t.boolean :open, default: false

      t.timestamps
    end
  end
end
