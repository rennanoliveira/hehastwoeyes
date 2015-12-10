require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new }
  context(:user)

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:username) }

  end

end
