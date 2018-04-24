# frozen_string_literal: true

module ApplicationHelper
  def navigation_for_signout
    return if user_signed_in?
    links_for_signout
  end

  def navigation_for_administrator
    return unless user_signed_in?
    return unless current_user.has_role? :administrator
    dropdown = [content_tag(:span, t('views.pages.global.role.administrator')), content_tag(:span, '', class: 'caret')]
    data = { toggle: 'dropdown' }
    aria = { haspopup: 'true', expanded: 'false' }
    links = [
      content_tag(:a, safe_join(dropdown), class: 'dropdown-toggle', data: data, role: 'button', aria: aria),
      content_tag(:ul, safe_join(links_for_administrator), class: 'dropdown-menu')
    ]
    content_tag :li, class: 'dropdown' do
      safe_join(links)
    end
  end

  def navigation_for_moderator
    return unless user_signed_in?
    return unless current_user.has_role? :moderator
  end

  def navigation_for_user
    return unless user_signed_in?
    return unless current_user.has_role? :user
    dropdown = [content_tag(:span, t('views.pages.global.role.user')), content_tag(:span, '', class: 'caret')]
    data = { toggle: 'dropdown' }
    aria = { haspopup: 'true', expanded: 'false' }
    links = [
      content_tag(:a, safe_join(dropdown), class: 'dropdown-toggle', data: data, role: 'button', aria: aria),
      content_tag(:ul, safe_join(links_for_user), class: 'dropdown-menu')
    ]
    content_tag :li, class: 'dropdown' do
      safe_join(links)
    end
  end

  private

  def links_for_signout
    links = [
      content_tag(:li, link_to(t('views.pages.global.sign_in'), new_user_session_path)),
      content_tag(:li, link_to(t('views.pages.global.registration'), new_user_registration_path))
    ]
    safe_join(links)
  end

  def links_for_administrator
    [
      content_tag(:li, link_to(t('views.pages.global.initiatives'), administration_initiatives_path)),
      content_tag(:li, link_to(t('views.pages.global.categories'), administration_categories_path)),
      content_tag(:li, link_to(t('views.pages.global.users'), administration_users_path)),
      content_tag(:li, link_to(t('views.pages.global.confirmating'), confirmating_administration_initiatives_path)),
      content_tag(:li, link_to(t('views.pages.global.fundraising'), fundraising_administration_initiatives_path)),
      content_tag(:li, link_to(t('views.pages.global.implementing'), implementing_administration_initiatives_path))
    ]
  end

  def links_for_user
    [
      content_tag(:li, link_to(t('views.pages.global.initiatives'), users_initiatives_path))
    ]
  end

  def flash_block(type)
    flash_classes = { success: 'alert alert-success', error: 'alert alert-danger' }
    content_tag(:div, class: flash_classes[type.to_sym]) do
      content_tag(:button, 'x', class: 'close clear', 'data-dismiss' => 'alert') + flash[type.to_sym]
    end
  end
end
