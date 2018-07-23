class SubjectStudent < ApplicationRecord
  belongs_to :student, foreign_key: :id
end
