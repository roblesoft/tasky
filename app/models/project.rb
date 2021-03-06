# frozen_string_literal: true

# project model
class Project < ApplicationRecord
  include Eventable

  has_many :user_projects, inverse_of: :project, dependent: :destroy
  has_many :list_columns, inverse_of: :project, dependent: :destroy
  has_many :events, as: :eventable, dependent: :destroy
  has_many :project_events, class_name: 'Event'
  has_many :users, through: :user_projects
  validates :title, presence: true
  enum status: %i[open on_work close]

  def assign_owner(user)
    user_projects.create(project_id: id, user_id: user.id, role: 'owner')
  end
end
