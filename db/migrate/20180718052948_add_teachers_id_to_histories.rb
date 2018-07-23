class AddTeachersIdToHistories < ActiveRecord::Migration[5.0]
  def change
    add_reference :histories, :teacher, foreign_key: true, after: :timestamp
  end
end
