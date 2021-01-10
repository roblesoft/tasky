# frozen_string_literal: true

# module for application helper
module ApplicationHelper
  def render_modal_content(title, model, &block)
    locals = { title: title, model: model, block: block }
    render partial: 'layouts/modal', locals: locals
  end
end
