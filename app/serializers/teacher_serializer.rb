class TeacherSerializer < ActiveModel::Serializer
  attributes :id, :name

  def name
    user = User.find(object.user_id)
    user.name
  end
end
