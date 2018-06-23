# frozen_string_literal: true

module ApplicationHelper
  def initialize(*)
    super
    @link = 'mdl-navigation__link'
  end

  # navigation for signout user
  def navigation_for_signout
    return if user_signed_in?
    safe_join(links_for_signout.map { |link| content_tag(:li, link) })
  end

  # navigation for signin user
  def navigation_for_user
    return unless user_signed_in?
    safe_join(links_for_signin.map { |link| content_tag(:li, link) })
  end

  # helper of navigation for administrator user
  def navigation_for_administrator
    return unless user_signed_in? # return if user not signin
    return unless current_user.has_role? :administrator # return if user not administrator
    content_tag(:li, link_to(t('views.pages.global.administration'), main_app.administration_main_path, class: @link))
  end

  # helper of navigation for moderator user
  def navigation_for_moderator
    return unless user_signed_in? # return if user not signin
    return unless current_user.has_role? :moderator # return if user not administrator
  end

  # helper to count how much time passed after adding
  def added_time(date)
    TimeDifference.between(date, Time.zone.now).humanize
  end

  private

  # links for signout user
  def links_for_signout
    [
      link_to(t('views.pages.global.sign_in'), new_user_session_path, class: @link),
      link_to(t('views.pages.global.registration'), new_user_registration_path, class: @link)
    ]
  end

  # OPTIMIZE: need to fix method size
  # links for signin user
  def links_for_signin
    unread_count = Notification.unread_count(current_user)
    [
      link_to(t('views.pages.global.initiatives'), main_app.users_initiatives_path, class: @link),
      link_to(pluralize(unread_count, t('views.pages.global.notifications')), notifications_path, class: @link),
      link_to(t('views.pages.global.profile.show'), main_app.user_path(current_user.id), class: @link),
      link_to(t('views.pages.global.profile.edit'), main_app.edit_user_registration_path, class: @link),
      link_to(t('views.pages.global.sign_out'), main_app.destroy_user_session_path, method: :delete, class: @link)
    ]
  end

  # helper for display flash
  def flash_block(type)
    flash_classes = { success: 'alert alert-success', error: 'alert alert-danger' }
    content_tag(:div, class: flash_classes[type.to_sym]) do
      content_tag(:button, 'x', class: 'close clear', 'data-dismiss' => 'alert') + flash[type.to_sym]
    end
  end
end
