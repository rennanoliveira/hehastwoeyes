class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    group_maker = GroupMaker.new(current_user, @group)
    if group_maker.save
      redirect_to group_path(code: @group.code), notice: 'Group successfully created!'
    else
      render :new, alert: 'Something went wrong'
    end
  end

  def show
    @group = Group.includes(:users).where(code: params[:code]).first
  end

  def search
    @group = Group.where(code: params[:code]).first
    if @group
      redirect_to group_path(code: @group.code), notice: 'Group found!'
    else
      redirect_to :back, notice: 'No group with given code was found.'
    end

  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end

end
