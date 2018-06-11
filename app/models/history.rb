class History < ApplicationRecord
  mount_uploader :image_name, AttendanceUploader
end
