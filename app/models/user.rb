# frozen_string_literal: true

# user model
class User < ApplicationRecord
  has_many :user_projects, inverse_of: :user
  has_many :tasks, inverse_of: :user
  has_many :events, inverse_of: :user

  validates :email, uniqueness: true
end
