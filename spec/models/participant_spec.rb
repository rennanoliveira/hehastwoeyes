require 'rails_helper'

RSpec.describe Participant, type: :model do
  let(:participant) { Participant.new }
  context(:participant)

  describe 'validations' do
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:group) }
  end

end
