# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    title { Faker::Lorem.words(number: 3) }
    description { Faker::Lorem.words(number: 3) }
  end
end
