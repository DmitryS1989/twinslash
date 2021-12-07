# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Tag, type: :model do
  before(:each) do
    @tag = FactoryBot.create(:tag)
  end

  it 'allow tag' do
    expect(@tag).to be_valid
  end

  it 'do not allow tag with an empty title' do
    @tag.title = ''
    expect(@tag).to_not be_valid
  end

  it 'Rise error Title has already been taken' do
    expect { FactoryBot.create(:tag) }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
