class Assignment < ApplicationRecord
  enum :status, { working: 10, late: 20, canceled: 30, concluded: 40 }

  scope :deleted, ->{ where.not(delete_date: nil) }
  scope :non_deleted, ->{ where(delete_date: nil) }

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "delete_date", "description", "due_date", "id",
     "id_value", "status", "title", "updated_at"]
  end
end
