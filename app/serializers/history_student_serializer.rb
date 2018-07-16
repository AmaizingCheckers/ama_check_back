class HistoryStudentSerializer < ActiveModel::Serializer
  attributes :id

  has_many :students, foreign_key: :student_id
end
