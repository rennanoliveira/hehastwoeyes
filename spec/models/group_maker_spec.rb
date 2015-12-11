require 'rails_helper'

RSpec.describe GroupMaker, type: :model do

  let(:user) { FactoryGirl.build :user }
  let(:group) { Group.new(name: 'Group') }
  let(:group_maker) { GroupMaker.new(user, group) }

  describe '#initialize' do
    it 'sets the user' do
      expect(group_maker.user).to eql user
    end

    it 'sets an empty group' do
      expect(group_maker.group).to be_a Group
    end

  end

  describe '#save' do
    it 'saves the group' do
      group_maker.save
      group = group_maker.group

      expect(group.new_record?).to be_falsy
    end
    it 'sets the manager to the passed user' do
      group_maker.save
      group = group_maker.group

      expect(group.manager).to eql user
    end
    it 'sets the passed user as a participant' do
      group_maker.save
      group = group_maker.group
      participant = group.participants.first

      expect(participant.user).to eql user
    end
  end

  describe '#errors' do
    it 'passes the group\'s errors' do
      group.name = nil
      group_maker = GroupMaker.new(user, group)
      group_maker.save

      expect(group_maker.errors).to_not be_empty
    end

    it 'is empty when no errors occur' do
      group_maker.save
      expect(group_maker.errors).to be_empty
    end

  end

end
