require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new }
  context(:user)

  describe 'relations' do
    it { is_expected.to have_many(:participants) }
    it { is_expected.to have_many(:managed_groups).class_name('Group').with_foreign_key(:manager_id) }
    it { is_expected.to have_many(:groups).through(:participants) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:username) }
  end

end
