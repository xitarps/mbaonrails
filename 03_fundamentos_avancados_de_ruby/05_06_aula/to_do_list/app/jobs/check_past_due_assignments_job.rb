class CheckPastDueAssignmentsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    past_due_assignments = Assignment.non_deleted
                                     .where(due_date: ..Time.current)
                                     .where.not(due_date: nil)
                                     .where.not(status: ['concluded', 'late', 'canceled'])

    past_due_assignments.update_all(status: 'late')
  end
end
