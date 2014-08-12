class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
      t.integer :user_id
      t.datetime :created_at
    end
    add_index :downloads, :user_id
  end
end
