# frozen_string_literal: true

# eventable concern
module Eventable
  extend ActiveSupport::Concern

  included do
    after_create :save_create_event
    after_update :save_update_event
    before_destroy :save_delete_event
  end

  def save_create_event
    new_event_for_newsfeed('create')
  end

  def save_update_event
    new_event_for_newsfeed('update')
  end

  def save_delete_event
    new_event_for_newsfeed('delete')
  end

  def new_event_for_newsfeed(name)
    project = is_a?(Project) ? self : self.project
    Event.create name: name, eventable: self, project: project
  end
end
