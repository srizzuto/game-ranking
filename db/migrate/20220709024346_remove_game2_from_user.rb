class RemoveGame2FromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :game2, :string
  end
end
