# frozen_string_literal: true

# list column list
class ListColumn < ApplicationRecord
  include Eventable

  belongs_to :project, inverse_of: :list_columns
  has_many :events, as: :eventable
  has_many :tasks, inverse_of: :list_column, dependent: :destroy
end
