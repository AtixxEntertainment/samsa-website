class AddVotesCountToComment < ActiveRecord::Migration
  def change
    add_column :comments, :votes, :integer, default: 0
    add_index :comments, :votes
  end
end
