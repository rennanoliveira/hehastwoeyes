require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:group) { Group.new }

  context 'on creation' do
    it 'generates a code' do
      group.code = nil
      group.save
      expect(group.code).to_not be_nil
    end
  end

end
