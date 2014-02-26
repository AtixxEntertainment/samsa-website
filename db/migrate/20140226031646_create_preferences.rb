class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.string :name, null: false
      t.string :value
    end
    add_index :preferences, :name, unique: true
  end
end
