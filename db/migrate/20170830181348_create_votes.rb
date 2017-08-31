class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :user_id, null: false
      t.integer :pitch_id, null: false
      t.integer :round_id, null: false

      t.timestamps
    end
  end
end
