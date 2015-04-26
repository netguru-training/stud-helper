class UserDecorator < BaseDecorator

  def link_to_edit_user
    h.link_to h.edit_user_registration_path do
      "#{user_picture} #{username}".html_safe
    end
  end

  def user_picture
    h.image_tag user.picture_url(:thumb) if picture?
  end

  def username
    name
  end
end
