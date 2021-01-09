# frozen_string_literal: true

FactoryBot.define do
  factory :user_project do
    user
    project
    role { Faker::Internet.username }
  end
end
