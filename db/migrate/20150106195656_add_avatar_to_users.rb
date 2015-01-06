class AddAvatarToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avatar, :string, null: false, default: "spec/images/avatar.png"
  end
end
