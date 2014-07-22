class CreateGameVersions < ActiveRecord::Migration
  def change
    create_table :game_versions do |t|
      t.string :tag
      t.text :changelog
      t.string :url

      t.timestamps
    end
  end
end
