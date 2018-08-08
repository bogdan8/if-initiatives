# frozen_string_literal: true

module InitiativesHelper
  def initialize(*)
    super
    @success = 'btn btn-sm btn-success'
    @danger = 'btn btn-sm btn-danger'
    @warning = 'btn btn-sm btn-warning'
  end

  def initiative_state_admin_links(initiative)
    if initiative.confirmating?
      for_confirmating(initiative)
    elsif initiative.fundraising?
      for_fundraising(initiative)
    elsif initiative.fundraised?
      for_fundraised(initiative)
    elsif initiative.implementing?
      for_implementing(initiative)
    end
  end

  def initiative_state_user_links_draft(initiative)
    edit = edit_users_initiative_path(initiative)
    confirmating = users_initiatives_confirmation_path(initiative)
    delete = users_initiative_path(initiative)
    data = { confirm: t('.button.confirm') }
    return unless initiative.draft? || initiative.rejected?
    safe_join([
      link_to(t('.button.edit'), edit, class: @warning),
      link_to(t('.button.confirmation'), confirmating, method: :put, class: @success),
      link_to(t('.button.destroy'), delete, method: :delete, data: data, class: @danger)
    ])
  end

  def initiative_state_user_links_fundraised(initiative)
    fundraised = users_initiatives_fundraise_path(initiative)
    return unless initiative.fundraising?
    safe_join([link_to(t('.button.fundraised'), fundraised, method: :put, class: @success)])
  end

  private

  def for_confirmating(initiative)
    fundraising = admins_initiatives_fundraise_path(initiative, state: :fundraising)
    rejected = admins_initiatives_rejection_path(initiative)
    safe_join([
      link_to(t('.button.confirmed'), fundraising, method: :put, class: @success),
      link_to(t('.button.rejected'), rejected, method: :put, class: @danger)
    ])
  end

  def for_fundraising(initiative)
    fundraised = admins_initiatives_fundraise_path(initiative, state: :fundraised)
    rejected = admins_initiatives_rejection_path(initiative)
    safe_join([
      link_to(t('.button.fundraised'), fundraised, method: :put, class: @success),
      link_to(t('.button.rejected'), rejected, method: :put, class: @danger)
    ])
  end

  def for_fundraised(initiative)
    implementing = admins_initiatives_implemention_path(initiative, state: :implementing)
    unimplemented = admins_initiatives_implemention_path(initiative, state: :unimplemented)
    safe_join([
      link_to(t('.button.implementing'), implementing, method: :put, class: @success),
      link_to(t('.button.unimplemented'), unimplemented, method: :put, class: @danger)
    ])
  end

  def for_implementing(initiative)
    implemented = admins_initiatives_implemention_path(initiative, state: :implemented)
    link_to(t('.button.implemented'), implemented, method: :put, class: @success)
  end

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
