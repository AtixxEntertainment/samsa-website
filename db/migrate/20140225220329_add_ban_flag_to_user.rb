class AddBanFlagToUser < ActiveRecord::Migration
  def change
    add_column :users, :banned, :boolean, default: false
    add_index :users, :banned
    add_index :users, :admin
  end
end
