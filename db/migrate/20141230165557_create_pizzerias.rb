class CreatePizzerias < ActiveRecord::Migration
  def change
    create_table :pizzerias do |t|
      t.string :name, null: false
      t.string :street, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip_code, null: false
      t.string :phone
      t.string :website
    end
  end
end
