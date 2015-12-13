class SecretSantaController < ApplicationController
  before_action :authenticate_user!

  def show
    @group = Group.where(code: params[:group_code]).first
    participant = @group.participants.where(user_id: current_user.id).first
    @secret_santa = participant.secret_santa
  end

end