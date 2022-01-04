# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Tag, type: :model do
  let(:tag) { FactoryBot.create(:tag) }
  let(:tag_dup) { FactoryBot.build(:tag) }

  before(:each) do
    tag.valid?
  end

  it 'tag correct' do
    expect(tag.errors).to be_empty
  end

  context 'tag with an empty title' do
    let(:tag) { FactoryBot.build(:tag, title: '') }
    it 'incorrect' do
      expect(tag.errors.full_messages).to include("Title can't be blank")
    end
  end

  it 'creating a tag with the same title' do
    tag_dup.valid?
    expect(tag_dup.errors.full_messages).to include('Title has already been taken')
  end
end
