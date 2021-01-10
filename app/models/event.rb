# frozen_string_literal: true

# event model
class Event < ApplicationRecord
  belongs_to :project
  belongs_to :user
  belongs_to :eventable, polymorphic: true
end
