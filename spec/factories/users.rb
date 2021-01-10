# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Movies::HitchhikersGuideToTheGalaxy.character }
    email { Faker::Internet.email }
    username { Faker::Internet.username }
  end
end
