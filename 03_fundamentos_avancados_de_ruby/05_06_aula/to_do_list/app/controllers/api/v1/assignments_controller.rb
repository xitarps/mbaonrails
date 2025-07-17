class Api::V1::AssignmentsController < Api::V1::ApplicationController
  before_action :fetch_assignment, only: %i[show update destroy]

  def index
    @assignments = Assignment.non_deleted.ransack(params[:q]).result(distinct: true)

    render json: @assignments
  end

  def create
    @assignment = Assignment.new(assignment_params)

    return render json: @assignment if @assignment.save

    render josn: { errors: @assignment.errors.full_messages }
  end

  def show
    render json: @assignment
  end

  def update
    return render json: @assignment if @assignment.update(assignment_params)

    render josn: { errors: @assignment.errors.full_messages }
  end

  def destroy
    @assignment.update(delete_date: Time.current)

    render json: {}, status: :no_content
  end

  private

  def assignment_params
    params.expect(assignment: [:title, :description, :status, :due_date])
  end

  def fetch_assignment
    begin
      @assignment = Assignment.non_deleted.find(params[:id])
    rescue
      return render json: { errors: 'Record not found' }
    end
  end
end
