# frozen_string_literal: true
require 'faker'
99.times do |n|
  name = Faker::Name.name
  email =  Faker::Internet.email
  password = 'password'
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               confirmed_at: Time.zone.now)
end
30.times do
  title = Faker::Hipster.word
  Tag.create title: title
end
if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password',
                    password_confirmation: 'password')
end
