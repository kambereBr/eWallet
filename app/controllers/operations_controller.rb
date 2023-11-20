class OperationsController < ApplicationController
  def index
    @operations = current_user.authored_operations
  end

  def show
    @operation = Operation.find(params[:id])
  end

  def new
    @operation = Operation.new
  end

  def create
    group_ids = params[:operation][:group_ids]
    ops_code = generate_operation_code
    group_ids.each do |group_id|
      operation_params = operation_params_with_group_id(group_id)
      @operation = current_user.authored_operations.build(operation_params)
      @operation.author_id = current_user
      @operation.operation_code = ops_code
      @operation.save!
    end

    redirect_to operations_path, notice: 'Operations were successfully created.'
  end

  private

  def operation_params_with_group_id(group_id)
    params.require(:operation).permit(:name, :amount).merge(group_id:)
  end

  def generate_operation_code
    loop do
      self.operation_code = SecureRandom.hex(10) # Generates a 6-character random hex string
      break unless Operation.exists?(operation_code:)
    end
  end
end
