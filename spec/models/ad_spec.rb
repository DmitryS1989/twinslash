# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Ad, type: :model do
  before(:each) do
    @ad = FactoryBot.create(:ad)
  end

  it 'allow ad' do
    expect(@ad).to be_valid
  end

  it 'do not allow ad with empty content' do
    @ad.content = ' '
    expect(@ad).to_not be_valid
  end

  it 'do not allow ad with an empty title' do
    @ad.title = ' '
    expect(@ad).to_not be_valid
  end

  it 'do not allow ad with empty tags' do
    @ad.tags = []
    expect(@ad).to_not be_valid
  end

  it 'allow ad with 2 tags' do
    @ad.tags << FactoryBot.create(:tag, title: 'moto')
  end

  it 'do not allow ad with an empty user_id' do
    @ad.user_id = ' '
    expect(@ad).to_not be_valid
  end

  it 'ad has status ' do
    expect(@ad.state).to be_truthy
  end
end
