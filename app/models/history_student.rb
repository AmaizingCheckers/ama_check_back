class HistoryStudent < ApplicationRecord
  has_many :students, primary_key: :student_id, foreign_key: :id
end
