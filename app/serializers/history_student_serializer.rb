class HistoryStudentSerializer < ActiveModel::Serializer
  attributes :id

  has_many :students, primary_key: :student_id
end
