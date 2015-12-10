class GroupMaker

  attr_reader :user, :group

  def initialize(user, group)
    @user = user
    @group = group
  end

  def save
    group.manager = user
    group.participants.build(user_id: user.id)
    group.save
  end

  def errors
    group.errors
  end

  private

end
