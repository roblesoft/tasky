# frozen_string_literal: true

# task model
class Task < ApplicationRecord
  include Eventable

  belongs_to :list_column, inverse_of: :tasks
  belongs_to :user, inverse_of: :tasks
  has_many :events, as: :eventable
  delegate :project, to: :list_column
end
