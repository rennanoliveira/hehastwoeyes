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

  describe '.from_omniauth(auth)' do
    let(:uid) { 999_999 }
    let(:provider) { 'facebook' }
    let(:auth_hash) do
      OmniAuth::AuthHash.new('uid' => uid,
                             'provider' => provider,
                             'info' => {
                                 'email' => 'user@email.com',
                                 'name' => 'Firstname Lastname'
                             })
    end
    it 'from new user should create a user' do
      user_previous_count = User.count

      User.from_omniauth(auth_hash)
      expect(User.count).to eql user_previous_count + 1
    end
    it 'from new user should set username to firstname+lastname' do
      user = User.from_omniauth(auth_hash)
      expect(user.username).to eql 'firstnamelastname'
    end
    it 'from existing user should not create a new user' do
      user.uid = uid
      user.provider = provider
      user.save!
      user_previous_count = User.count

      User.from_omniauth(auth_hash)
      expect(User.count).to eql user_previous_count
    end
  end

end
