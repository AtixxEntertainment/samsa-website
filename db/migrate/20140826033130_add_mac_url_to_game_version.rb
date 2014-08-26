class AddMacUrlToGameVersion < ActiveRecord::Migration
  def change
    rename_column :game_versions, :url, :windows_url
    add_column :game_versions, :mac_url, :string
  end
end
