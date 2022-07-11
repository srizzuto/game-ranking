class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.string :name, null: false
      t.integer :graphics, null: false
      t.integer :story, null: false
      t.integer :challenge, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
