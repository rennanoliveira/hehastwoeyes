require 'rails_helper'

RSpec.describe GroupDrawer, type: :model do

  let!(:group) { FactoryGirl.create(:group) }
  let!(:participant_1) { FactoryGirl.create(:participant, group: group) }
  let!(:participant_2) { FactoryGirl.create(:participant, group: group) }
  let!(:participant_3) { FactoryGirl.create(:participant, group: group) }
  let(:group_drawer) { GroupDrawer.new(group) }

  describe '#draw' do
    it 'generates secret santas for every participant' do
      drawn_pairs = [[participant_1, participant_2], [participant_2, participant_3], [participant_3, participant_1]]
      allow(group_drawer).to receive(:generate_pairs).and_return(drawn_pairs)

      group_drawer.draw


      expect(group.secret_santas.count).to eql group.participants.count
    end
    it 'sets the group as drawn' do
      drawn_pairs = [[participant_1, participant_2], [participant_2, participant_3], [participant_3, participant_1]]
      allow(group_drawer).to receive(:generate_pairs).and_return(drawn_pairs)
      group.drawn = false
      group_drawer.draw

      expect(group.drawn?).to be true
    end
  end

end
