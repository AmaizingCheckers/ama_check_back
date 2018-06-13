class HistoryStudentSerializer < ActiveModel::Serializer
  attributes :id

  has_many :students, foreign_key: :id
end
