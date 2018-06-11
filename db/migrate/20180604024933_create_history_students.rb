class CreateHistoryStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :history_students do |t|
      t.references :history, foreign_key: true
      t.references :student, foreign_key: true
      t.timestamps
    end
  end
end
