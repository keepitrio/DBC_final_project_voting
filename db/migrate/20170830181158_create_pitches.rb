class CreatePitches < ActiveRecord::Migration[5.1]
  def change
    create_table :pitches do |t|
    	t.string :title
    	t.text :description
    	t.integer :user_id
    	t.integer :team_id

      t.timestamps
    end
  end
end
