class StudentSerializer < ActiveModel::Serializer
  attributes :id, :name, :sex, :grade

  def sex
    case object.sex
    when 0 then
      '男'
    when 1 then
      '女'
    end
  end
end
