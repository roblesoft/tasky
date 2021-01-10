# frozen_string_literal: true

# task model
class Task < ApplicationRecord
  belongs_to :list_column, inverse_of: :tasks
  belongs_to :user, inverse_of: :tasks
end
