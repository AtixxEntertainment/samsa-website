class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nombres
      t.string :email
      t.string :imagen
      t.boolean :admin, default: false
      t.timestamps
    end
  end
end
