class HistoryStudent < ApplicationRecord
  has_many :students, primary_key: :id, foreign_key: :student_id
end
