# frozen_string_literal: true

FactoryBot.define do
  factory :ad, aliases: [:ad_second] do
    association :user
    title { Faker::Hipster.sentence(word_count: 3) }
    body_ad { Faker::Hipster.paragraph(sentence_count: 2) }
    tags { [FactoryBot.create(:tag)] }
  end
end
