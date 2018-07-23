class StudentImage < ApplicationRecord
  mount_uploader :image_path, StudentImageUploader
end
