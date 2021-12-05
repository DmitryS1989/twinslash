# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Ad, type: :model do
  before(:each) do
    @ad = FactoryBot.create(:ad)
  end
  it 'Validate ad' do
    expect(@ad.valid?).to eql(true)
  end

  it "doesn't validate an ad with an empty content" do
    @ad.content = ' '
    expect(@ad.valid?).to eql(false)
  end
  it "doesn't validate an ad with an empty title" do
    @ad.title = ' '
    expect(@ad.valid?).to eql(false)
  end
  it "doesn't validate an ad with an empty user_id" do
    @ad.user_id = ' '
    expect(@ad.valid?).to eql(false)
  end
  # 
