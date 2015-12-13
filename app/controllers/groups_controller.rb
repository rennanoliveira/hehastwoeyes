class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    group_maker = GroupMaker.new(current_user, @group)
    if group_maker.save
      redirect_to @group, notice: 'Group successfully created!'
    else
      render :new, alert: 'Something went wrong'
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  def search

  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end

end
