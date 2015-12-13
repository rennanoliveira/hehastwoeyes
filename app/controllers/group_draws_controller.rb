class GroupDrawsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_group
  before_action :verify_group_manager

  def create
    GroupDrawer.new(@group).draw
    redirect_to group_path(code: @group.code), notice: 'Pairs Drawn!'
  end

  private

  def load_group
    @group = Group.where(code: params[:group_code]).first
  end

  def verify_group_manager
    @group.manager == current_user
  end

end