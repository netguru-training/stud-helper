module ApplicationHelper
  def admin?
    user_signed_in? && current_user.admin?
  end

  def nav_link(text, path)
    link_to text, path, class: ("active" if current_page?(path))
  end

  def button_to(text, path, options={})
    link_to text, path, options.merge(class: "btn btn-primary")
  end
end
