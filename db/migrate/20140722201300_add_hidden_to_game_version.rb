class AddHiddenToGameVersion < ActiveRecord::Migration
  def change
    add_column :game_versions, :hidden, :boolean, default: false
    add_index :game_versions, :hidden
  end
end
