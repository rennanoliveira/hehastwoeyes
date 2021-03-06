require 'rails_helper'

RSpec.describe SecretSantaMaker, type: :model do

  let(:list) { [1, 2, 3, 4] }
  let(:secret_santa_maker) { SecretSantaMaker.new(list) }

  describe '#generate' do
    it 'generates an array with the same size as the passed list' do
      generated_list = secret_santa_maker.generate
      expect(generated_list.size).to eql list.size
    end

    it 'generates an array of 2-elements-array' do
      generated_list = secret_santa_maker.generate
      expect(generated_list.first.size).to eql 2
    end

    it 'first element never repeats' do
      generated_list = secret_santa_maker.generate
      expect(generated_list.uniq(&:first).size).to eql generated_list.size
    end

    it 'last element never repeats' do
      generated_list = secret_santa_maker.generate
      expect(generated_list.uniq(&:last).size).to eql generated_list.size
    end

    it 'creates a circular list' do
      generated_list = secret_santa_maker.generate
      expect(generated_list.last[1]).to eql generated_list.first[0]
    end
  end

end
