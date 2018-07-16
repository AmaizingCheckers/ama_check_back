class HistoryStudentSerializer < ActiveModel::Serializer
  attributes :id

  has_many :students, primary_key: :id, foreign_key: :student_id
end
