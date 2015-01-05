class CreateUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.integer :review_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
