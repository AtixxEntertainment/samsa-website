class CreateHeaderCharacters < ActiveRecord::Migration
  def change
    create_table :header_characters do |t|
      t.string :nombre, null: false
      t.integer :profundidad, default: 1
      t.integer :posicion_horizontal, default: 0
      t.integer :posicion_vertical, default: 0
      t.timestamps
    end
  end
end
