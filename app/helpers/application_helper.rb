module ApplicationHelper
  # Returns the full title.
  def full_title(page_title = '')
    base_title = "Lowdown"
    if page_title.empty?
      base_title
    else
      "#{page_title} ~ #{base_title}"
    end
  end

  # Adds 'active' class navbar links.
  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'active' : ''

    content_tag(:li, :class => class_name) do
      link_to link_text, link_path
    end
  end
end
