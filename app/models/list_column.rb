# frozen_string_literal: true

# list column list
class ListColumn < ApplicationRecord
  belongs_to :project, inverse_of: :list_columns
  has_many :tasks, inverse_of: :list_column
end
