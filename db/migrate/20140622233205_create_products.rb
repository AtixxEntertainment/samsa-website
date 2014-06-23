class CreateProducts < ActiveRecord::Migration
  def up
    create_table :products do |t|
      t.string :image
      t.timestamps
    end
    Product.create_translation_table!(
      title: :string,
      kind: :string,
      producer: :string,
      summary: :text
    )
  end

  def down
    drop_table :products
    Product.drop_translation_table!
  end
end
