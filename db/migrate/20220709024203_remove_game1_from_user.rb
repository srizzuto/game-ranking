class RemoveGame1FromUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :game1, :string
  end
end
