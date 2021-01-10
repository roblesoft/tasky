# frozen_string_literal: true

# project model
class Project < ApplicationRecord
  has_many :user_projects, inverse_of: :project
  has_many :list_columns, inverse_of: :project
  enum status: %i[open on_work close]

  def assign_owner(user)
    user_projects.create(project_id: id, user_id: user.id, role: 'owner')
  end
end
