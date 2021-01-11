# frozen_string_literal: true


# projects helper
module ProjectsHelper
  def news_color(type)
    case type
    when 'create'
      'primary'
    when 'update'
      'success'
    when 'delete_task' || 'delte_listcolumn'
      'danger'
    else
      'info'
    end
  end
end
