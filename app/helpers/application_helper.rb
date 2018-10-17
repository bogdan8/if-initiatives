# frozen_string_literal: true

module ApplicationHelper
  def initialize(*)
    super
    @link = 'nav-link'
  end

  def navigation_for_signout
    return if user_signed_in?

    safe_join(links_for_signout.map { |link| content_tag(:li, link, class: 'nav-item') })
  end

  def navigation_for_user
    return unless user_signed_in?

    unread_count = Notification.unread_count(current_user)
    safe_join(links_for_signin(unread_count).map { |link| content_tag(:li, link, class: 'nav-item') })
  end

  def navigation_for_admin
    return unless admin_signed_in?

    link = link_to(t('.admin.title'), main_app.admin_main_path, class: @link)
    content_tag(:li, link, class: 'nav-item')
  end

  def added_time(date)
    TimeDifference.between(date, Time.zone.now).humanize
  end

  private

  def links_for_signout
    [
      link_to(t('.sign_in.button.new'), new_user_session_path, class: @link),
      link_to(t('.registration.button.new'), new_user_registration_path, class: @link)
    ]
  end

  def links_for_signin(unread_count)
    [
      link_to(t('.my.initiatives.title'), main_app.users_initiatives_path, class: @link),
      link_to(t('.notifications.title', count: unread_count), notifications_path, class: @link),
      link_to(t('.profile.button.show'), main_app.edit_user_registration_path, class: @link),
      link_to(t('.sign_out.button.destroy'), main_app.destroy_user_session_path, method: :delete, class: @link)
    ]
  end

  def flash_block(type)
    flash_classes = { success: 'alert alert-success', error: 'alert alert-danger' }
    content_tag(:div, class: flash_classes[type.to_sym], id: 'alert') do
      content_tag(:button, 'x', class: 'close clear', 'data-dismiss' => 'alert') + flash[type.to_sym]
    end
  end

  def google_map(data)
    map_url = "https://www.google.com/maps/embed/v1/place?key=#{ENV['MAP_KEY']}&q=#{data.latitude},#{data.longitude}"
    %(<iframe frameborder="0" style="border:0" src="#{map_url}" allowfullscreen></iframe>)
  end
end
