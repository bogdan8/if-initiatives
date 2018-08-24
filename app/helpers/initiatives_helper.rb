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
    states = %i[confirmating fundraising rejected fundraised implementing reporting unimplemented implemented locked]
    states.map { |state| [t(".global.#{state}"), state] }
  end

  def collection_user_states
    states = %i[draft confirmating fundraising rejected fundraised]
    states << %i[implementing reporting unimplemented implemented locked]
    states.flatten.map { |state| [t(".global.#{state}"), state] }
  end

  def collection_states
    states = %i[fundraising fundraised implementing reporting unimplemented implemented]
    states.map { |state| [t(".global.#{state}"), state] }
  end
end
