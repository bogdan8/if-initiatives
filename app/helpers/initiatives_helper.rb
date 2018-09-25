# frozen_string_literal: true

module InitiativesHelper
  def liqpay(liqpay_request)
    return unless current_user
    liqpay_button liqpay_request, title: t('.pay')
  end

  def category_link(initiative)
    safe_join(category_links_array(initiative))
  end

  def category_links_array(initiative)
    badge = 'badge badge-light'
    initiative.categories.map { |item| content_tag(:span, link_to(item.title, category_path(item)), class: badge) }
  end

  def collection_admins_states
    states = %i[verifying rejected fundraising implementing blocked completed unfulfilled archived]
    states.map { |state| [I18n.t(".global.state.#{state}"), state] }
  end

  def collection_user_states
    states = %i[draft verifying rejected fundraising implementing blocked completed unfulfilled archived]
    states.flatten.map { |state| [I18n.t(".global.state.#{state}"), state] }
  end

  def collection_states
    states = %i[fundraising implementing blocked completed unfulfilled]
    states.map { |state| [I18n.t(".global.state.#{state}"), state] }
  end
end
