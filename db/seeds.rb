# frozen_string_literal: true

require 'faker'
99.times do
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
100.times do
  img = rand(1..5)
  tags = Tag.find_by_id(rand(1..Tag.all.size))
  title = Faker::Hipster.sentence(word_count: 3)
  user = User.find_by_id(rand(1..User.all.size)).id
  content = Faker::Hipster.paragraph(sentence_count: 2)
  ad = Ad.new(title: title, content: content, user_id: user, state: :moderating)
  rand(1..3).times do
    ad.images.attach(io: File.open(Rails.root.join("app/assets/images/#{img}.jpeg")),
                     filename: "#{img}.jpeg")
  end
  ad.tags << tags
  ad.save
end
if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password',
                    password_confirmation: 'password')
end
