# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    title { Faker::Lorem.words(number: 3) }
    description { Faker::Lorem.words(number: 3) }
    user
    list_column
  end
end
