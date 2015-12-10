require 'rails_helper'

RSpec.describe GroupMaker, type: :model do

  let(:user) { FactoryGirl.build :user }
  let(:group_maker) { GroupMaker.new(user) }

  describe '#initialize' do
    it 'sets the user' do
    end

    it 'sets an empty group' do
    end

  end

  describe '#save' do

  end

  describe '#errors' do

  end

end
