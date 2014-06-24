class MakeCommentsPolymorphic < ActiveRecord::Migration
  def up
    change_table :comments do |t|
      t.rename :post_id, :commentable_id
      t.string :commentable_type
    end
    add_index :comments, [:commentable_id, :commentable_type]

    # make all existent comments belong to pages
    Comment.update_all commentable_type: "Page"
  end
end
