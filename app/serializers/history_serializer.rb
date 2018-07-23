class HistorySerializer < ActiveModel::Serializer
  attributes :id, :image_name, :date

  belongs_to :subject

  def date
    date = object.timestamp.strftime('%Y-%m-%dT%H:%M')
  end
end
