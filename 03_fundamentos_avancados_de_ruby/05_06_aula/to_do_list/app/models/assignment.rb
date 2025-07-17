class Assignment < ApplicationRecord
  enum :status, { working: 10, late: 20, canceled: 30, concluded: 40 }

  scope :deleted, ->{ where.not(delete_date: nil) }
  scope :non_deleted, ->{ where(delete_date: nil) }
end
