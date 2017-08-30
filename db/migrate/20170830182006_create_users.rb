class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :student_preference
      t.references :team, foreign_key: true
      t.boolean :admin

      t.timestamps
    end
  end
end
