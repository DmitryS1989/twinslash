# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'carlospaz' }
    email { 'carlospaz@email.com' }
    password { '123456' }
    confirmed_at { Time.zone.now }
  end
end
