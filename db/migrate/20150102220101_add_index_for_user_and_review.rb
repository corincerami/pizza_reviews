class AddIndexForUserAndReview < ActiveRecord::Migration
  def change
    add_index :comments, :user_id
    add_index :comments, :review_id
  end
end
