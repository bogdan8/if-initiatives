# frozen_string_literal: true

module ApplicationHelper
  # navigation for signout user
  def navigation_for_signout
    return if user_signed_in?
    links_for_signout
  end

  # navigation for signin user
  def navigation_for_user
    return unless user_signed_in?
    dropdown = [content_tag(:span, t('views.pages.global.role.user')), content_tag(:span, '', class: 'caret')]
    data = { toggle: 'dropdown' }
    aria = { haspopup: 'true', expanded: 'false' }
    links = [ # array of links for user
      content_tag(:a, safe_join(dropdown), class: 'dropdown-toggle', data: data, role: 'button', aria: aria),
      content_tag(:ul, safe_join(links_for_signin), class: 'dropdown-menu')
    ]
    content_tag :li, class: 'dropdown' do
      safe_join(links)
    end
  end

  # helper of navigation for administrator user
  def navigation_for_administrator
    return unless user_signed_in? # return if user not signin
    return unless current_user.has_role? :administrator # return if user not administrator
    link_to t('views.pages.global.initiatives'), administration_initiatives_path
  end

  # helper of navigation for moderator user
  def navigation_for_moderator
    return unless user_signed_in? # return if user not signin
    return unless current_user.has_role? :moderator # return if user not administrator
  end

  private

  # links for signout user
  def links_for_signout
    links = [
      content_tag(:li, link_to(t('views.pages.global.sign_in'), new_user_session_path)),
      content_tag(:li, link_to(t('views.pages.global.registration'), new_user_registration_path))
    ]
    safe_join(links)
  end

  # links for signin user
  def links_for_signin
    [
      content_tag(:li, link_to(t('views.pages.global.initiatives'), users_initiatives_path)),
      content_tag(:li, link_to(t('views.pages.global.profile.show'), users_user_path(current_user.id))),
      content_tag(:li, link_to(t('views.pages.global.profile.edit'), edit_user_registration_path)),
      content_tag(:li, link_to(t('views.pages.global.sign_out'), destroy_user_session_path, method: :delete))
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
