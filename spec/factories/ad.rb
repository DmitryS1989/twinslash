# frozen_string_literal: true

FactoryBot.define do
  factory :ad do
    association :user
    title { 'MyString' }
    content { 'MyText' }
    tags { [FactoryBot.create(:tag)] }
    # after(:build) do |culture|
    #   culture.images.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'soy.jpeg')),
    #                         filename: 'soy.jpeg', content_type: 'image/jpeg')
    # end
  end
end
