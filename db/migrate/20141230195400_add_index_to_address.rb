class AddIndexToAddress < ActiveRecord::Migration
  def change
    add_index :pizzerias, [:street, :city, :state], unique: true, name: 'address'
  end
end
