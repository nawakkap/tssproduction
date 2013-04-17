module ApplicationHelper
  def conditional_tag(tag, content, option, condition = true)
    condition ? content_tag(tag, content, option) : content
  end
end
