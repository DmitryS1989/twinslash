# frozen_string_literal: true

30.times do
  title = Faker::Hipster.word
  Tag.create title: title
end
if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password',
                    password_confirmation: 'password')
end
