# frozen_string_literal: true

module ApplicationHelper
  # navigation for signout user
  def navigation_for_signout
    return if user_signed_in?
    safe_join(links_for_signout)
  end

  # navigation for signin user
  def navigation_for_user
    return unless user_signed_in?
    safe_join(links_for_signin)
  end

  # helper of navigation for administrator user
  def navigation_for_administrator
    return unless user_signed_in? # return if user not signin
    return unless current_user.has_role? :administrator # return if user not administrator
    link_to t('views.pages.global.administration'), administration_home_path, class: 'mdl-navigation__link'
  end

  # helper of navigation for moderator user
  def navigation_for_moderator
    return unless user_signed_in? # return if user not signin
    return unless current_user.has_role? :moderator # return if user not administrator
  end

  private

  # links for signout user
  def links_for_signout
    [
      link_to(t('views.pages.global.sign_in'), new_user_session_path, class: 'mdl-navigation__link'),
      link_to(t('views.pages.global.registration'), new_user_registration_path, class: 'mdl-navigation__link')
    ]
  end

  # links for signin user
  def links_for_signin
    [
      link_to(t('views.pages.global.initiatives'), users_initiatives_path, class: 'mdl-navigation__link'),
      link_to(t('views.pages.global.profile.show'), users_user_path(current_user.id), class: 'mdl-navigation__link'),
      link_to(t('views.pages.global.profile.edit'), edit_user_registration_path, class: 'mdl-navigation__link'),
      link_to(t('views.pages.global.sign_out'), destroy_user_session_path, method: :delete, class: 'mdl-navigation__link')
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
