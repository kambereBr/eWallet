class OperationsController < ApplicationController
  before_action :set_group

  def index
    @operations = @group.operations.order(created_at: :desc)
    @total_amount = @operations.sum(:amount)
  end

  def show
    @operation = Operation.find(params[:id])
  end

  def new
    @operation = Operation.new
  end

  def create
    @operation = @group.operations.build(operation_params)
    ops_code = generate_operation_code
    @operation.author_id = current_user.id
    @operation.operation_code = ops_code

    if @operation.save!
      redirect_to group_operations_path(@group), notice: 'Operation was successfully created.'
    else
      render :new
    end
  end

  private

  def operation_params
    params.require(:operation).permit(:name, :amount)
  end

  def generate_operation_code
    @operation_code = SecureRandom.hex(10) # Generates a 10-character random hex string
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
