class HistoryStudent < ApplicationRecord
  has_many :students, foreign_key: :id
end
