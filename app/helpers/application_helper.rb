module ApplicationHelper
  def icon_tag(icon)
    content_tag :i, '', class: "fa fa-#{icon}"
  end

  def selected_link_to(*args)
    path = args[1]
    args[2] ||= {}
    args[2][:class] ||= ''
    args[2][:class] += ' selected' if path == request.fullpath
    link_to *args
  end
end
