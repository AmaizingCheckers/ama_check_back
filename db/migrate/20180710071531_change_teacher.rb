class ChangeTeacher < ActiveRecord::Migration[5.0]
  def change
    remove_column :teachers, :name, :string
    remove_column :teachers, :password, :string
    add_reference :teachers, :user, foreign_key: true, after: :id
  end
end
