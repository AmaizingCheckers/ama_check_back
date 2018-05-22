class CreateStudentImages < ActiveRecord::Migration[5.0]
  def change
    create_table :student_images do |t|
      t.references :student, foreign_key: true
      t.string :image_path

      t.timestamps
    end
  end
end
