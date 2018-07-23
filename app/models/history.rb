class History < ApplicationRecord
  mount_uploader :image_name, AttendanceUploader

  belongs_to :subject
end
