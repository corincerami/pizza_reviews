class AddIndexToUsersAndVotes < ActiveRecord::Migration
  def change
    add_index :votes, [:review_id, :user_id], unique: true
    add_index :votes, :user_id
  end
end
