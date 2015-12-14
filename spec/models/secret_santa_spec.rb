require 'rails_helper'

RSpec.describe SecretSanta, type: :model do
  let(:secret_santa) { SecretSanta.new }
  subject { secret_santa }

  describe 'relations' do
    it { is_expected.to belong_to(:group) }
    it { is_expected.to belong_to(:participant) }
    it { is_expected.to belong_to(:friend).class_name('Participant') }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:group) }
    it { is_expected.to validate_presence_of(:participant) }
    it { is_expected.to validate_presence_of(:friend) }
  end

end
