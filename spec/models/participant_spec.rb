require 'rails_helper'

RSpec.describe Participant, type: :model do
  let(:participant) { Participant.new }
  context(:participant)

  describe 'validations' do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:group_id) }
    it { is_expected.to validate_uniqueness_of(:group_id).scoped_to(:user_id) }
  end

end
