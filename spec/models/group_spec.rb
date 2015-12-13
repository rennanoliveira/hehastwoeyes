require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:group) { Group.new }
  subject { group }

  describe 'relations' do
    it { is_expected.to belong_to(:manager).class_name('User') }
    it { is_expected.to have_many(:participants).inverse_of(:group) }
    it { is_expected.to have_many(:users).through(:participants) }
    it { is_expected.to have_many(:secret_santas).inverse_of(:group) }

    it { is_expected.to accept_nested_attributes_for(:participants) }
    it { is_expected.to accept_nested_attributes_for(:secret_santas) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:manager) }
    it 'validates presence of code' do
      group.valid?
      expect(group.errors[:code]).to_not be_nil
    end
  end

  describe 'creation' do
    it 'generates a code' do
      group.code = nil
      group.save
      expect(group.code).to_not be_nil
    end
    it 'generates a random code everytime' do
      group.save
      first_code = group.code

      group.code = nil
      group.save
      second_code = group.code

      expect(first_code).to_not eql second_code
    end
  end

end
