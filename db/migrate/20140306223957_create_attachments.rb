class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :name, null: false
      t.string :file
      t.timestamps
    end
    add_index :attachments, :name
  end
end
