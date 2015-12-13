class ParticipantsController < ApplicationController
  before_action :authenticate_user!

  def new
    search_group
    @participant = @group.participants.build
  end

  def create
    @group = Group.find(params[:group_code])
    @participant = @group.participants.build(participant_params)
    @participant.user = current_user
    if @participant.save
      redirect_to group_path(code: @group.code), notice: 'You have joined the group!'
    else
      render :new, alert: 'Something went wrong'
    end
  end

  private

  def search_group
    @group = Group.where(code: params[:group_code]).first
  end

  def participant_params
    params.require(:participant).permit(:group_id, :user_id)
  end

end
