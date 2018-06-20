class CreateTeacherClassrooms < ActiveRecord::Migration[5.0]
  def change
    create_table :teacher_classrooms do |t|
      t.references :teacher, foreign_key: true
      t.references :classroom, foreign_key: true

      t.timestamps
    end
  end
end
