class AddPlatformToDownload < ActiveRecord::Migration
  def change
    add_column :downloads, :platform, :string
    add_column :downloads, :path, :string
    add_index :downloads, :platform
    Download.reset_column_information
    Download.update_all(platform: "windows", path: "http://samsarpg.com/game/samsa-1.1.1.zip")
  end
end
