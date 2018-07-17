class HistoryStudent < ApplicationRecord
  has_many :students, primary_key: :student_id
end
