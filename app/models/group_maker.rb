class GroupMaker

  attr_reader :group

  def initialize(user)
    @user = user
    @group = build_group
  end

  def create
    group.manager = user
    group.participants.build(user: user)
    group.save
  end

  def errors
    group.errors
  end

  private

  attr_reader :user

  def build_group
    Group.new
  end

end