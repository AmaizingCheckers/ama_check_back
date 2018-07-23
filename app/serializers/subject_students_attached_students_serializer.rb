class SubjectStudentsAttachedStudentsSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :student, foreign_key: :id
end
