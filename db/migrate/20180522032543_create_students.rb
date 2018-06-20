class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :name
      t.integer :sex
      t.integer :grade

      t.timestamps
    end
  end
end
