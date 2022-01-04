# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Ad, type: :model do
  let(:ad) { FactoryBot.create(:ad) }

  before(:each) do
    ad.valid?
  end

  it 'add correct' do
    expect(ad.errors.full_messages).to be_empty
  end

  context 'ad with an empty body ad' do
    let(:ad) { FactoryBot.build(:ad, body_ad: ' ') }
    it 'incorrect' do
      expect(ad.errors.full_messages).to include("Body ad can't be blank")
    end
  end

  context 'ad with an empty title' do
    let(:ad) { FactoryBot.build(:ad, title: ' ') }
    it 'incorrect' do
      expect(ad.errors.full_messages).to include("Title can't be blank")
    end
  end

  context 'ad with an empty tags' do
    let(:ad) { FactoryBot.build(:ad, tags: []) }
    it 'incorrect' do
      expect(ad.errors.full_messages).to include("Tags can't be blank")
    end
  end

  context 'ad with an empty user_id' do
    let(:ad) { FactoryBot.build(:ad, user_id: '') }
    it 'incorrect' do
      expect(ad.errors.full_messages).to include("User can't be blank")
    end
  end

  it 'ad has status ' do
    expect(ad.state).to eq('draft')
  end
end
