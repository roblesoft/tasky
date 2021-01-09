# frozen_string_literal: true

# user project model
class UserProject < ApplicationRecord
  belongs_to :user, inverse_of: :user_projects
  belongs_to :project, inverse_of: :user_projects
end
