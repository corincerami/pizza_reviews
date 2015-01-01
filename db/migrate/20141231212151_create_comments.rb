class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.text :comment, null: false
      t.integer :user_id, null: false
      t.integer :review_id, null: false
      t.timestamps
    end
  end
end
