class RemoveAndAddColumnHistory < ActiveRecord::Migration[5.0]
  def change
    remove_reference :histories, :student, foreign_key: true
    add_column :histories, :image_name, :string
  end
end
