class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = current_user.groups.includes(icon_attachment: :blob)
    @user_operations = Operation.where(author_id: current_user.id)
    @total_amount = @user_operations.sum(:amount)
  end

  def show
    @group = Group.find(params[:id])
    @user_operation = @group.operations.where(author_id: current_user.id)
    @group_amount = @user_operation.sum(:amount)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.author_id = current_user.id
    if @group.save!
      redirect_to groups_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
