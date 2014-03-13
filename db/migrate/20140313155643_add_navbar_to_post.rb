class AddNavbarToPost < ActiveRecord::Migration
  def change
    add_column :posts, :navbar, :boolean, default: false
    add_index :posts, :navbar
  end
end
