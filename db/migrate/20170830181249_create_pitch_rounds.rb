class CreatePitchRounds < ActiveRecord::Migration[5.1]
  def change
    create_table :pitch_rounds do |t|
    	t.integer :pitch_id
    	t.integer :round_id

      t.timestamps
    end
  end
end
