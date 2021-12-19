# frozen_string_literal: true

FactoryBot.define do
  factory :ad do
    association :user
    title { Faker::Hipster.sentence(word_count: 3) }
    content { Faker::Hipster.paragraph(sentence_count: 2) }
    tags { [FactoryBot.create(:tag)] }
  end
end
