# frozen_string_literal: true

# project model
class Project < ApplicationRecord
  has_many :user_projects, inverse_of: :project
  has_many :list_columns, inverse_of: :project
  enum status: %i[open on_work close]
end
