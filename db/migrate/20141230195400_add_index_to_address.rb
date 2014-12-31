class AddIndexToAddress < ActiveRecord::Migration
  def change
    add_index :pizzerias, [:name, :street, :city, :state], unique: true, name: 'address'
  end
end
