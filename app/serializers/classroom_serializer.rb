class ClassroomSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :subjects
end
