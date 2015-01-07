class AddPhotoToPizzeria < ActiveRecord::Migration
  def change
    add_column :pizzerias, :photo, :string
  end
end
