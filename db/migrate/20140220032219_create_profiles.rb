class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user, null: false
      t.string :uid, null: false
      t.string :provider, null: false
      t.string :name
      t.string :nickname
      t.string :email
      t.string :image
      t.string :location
      t.string :description
      t.string :token_access
      t.string :token_secret
      t.text :raw_info
      t.text :urls
      t.timestamps
    end
  end
end
