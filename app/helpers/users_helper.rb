module UsersHelper
  def display_links
    links = ''
    if user_signed_in?
      links << (content_tag :p, 'Logged in as: ')
      links << (content_tag :p, (link_to current_user.name, current_user))
      links << (content_tag :p, (link_to 'Log out', users_log_out_path, method: :delete))
      links << (content_tag :p, (link_to 'Create event', new_event_path))
    else
      links << (content_tag :p, (link_to 'Sign in', users_sign_in_path))
      links << (content_tag :p, (link_to 'Sign Up', new_user_path))
    end
    links.html_safe
  end
end
