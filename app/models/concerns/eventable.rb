# frozen_string_literal: true

# eventable concern
module Eventable
  extend ActiveSupport::Concern

  included do
    after_create :save_create_event
    before_update :save_update_event
    before_destroy :save_delete_event

    def self.current_user=(user)
      Thread.current[:current_user] = user
    end

    def current_user
      Thread.current[:current_user]
    end
  end

  def save_create_event
    new_event_for_newsfeed('create')
  end

  def save_update_event
    return new_event_for_newsfeed('move') if is_a?(Task)

    new_event_for_newsfeed('update')
  end

  def save_delete_event
    new_event_for_newsfeed("delete_#{model_name.to_s.downcase}")
  end

  def new_event_for_newsfeed(name)
    project = is_a?(Project) ? self : self.project
    Event.create name: name, eventable: self, project: project,
                 user: current_user
  end
end
