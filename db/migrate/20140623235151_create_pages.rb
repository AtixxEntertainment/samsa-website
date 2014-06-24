class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title

      t.timestamps
    end
    add_index :pages, :title
  end
end
