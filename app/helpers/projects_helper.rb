# frozen_string_literal: true


# projects helper
module ProjectsHelper
  def news_color(type)
    case type
    when 'create'
      'primary'
    when 'update'
      'success'
    when 'delete'
      'danger'
    else
      'info'
    end
  end
end
