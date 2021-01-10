# frozen_string_literal: true

FactoryBot.define do
  factory :list_column do
    title { Faker::Lorem.words(number: 3) }
    description { Faker::Lorem.words(number: 3) }
    sort_order { 2 }
    project
  end
end
