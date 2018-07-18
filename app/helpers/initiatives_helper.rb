# frozen_string_literal: true

module InitiativesHelper
  def initialize(*)
    super
    @success = 'mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent btn-success'
    @danger = 'mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent btn-danger'
    @warning = 'mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--accent btn-warning'
  end

  # helper of links for administrator
  def initiative_state_administrator_links(initiative)
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

  # helper of links for user with initiative state 'draft' or 'confirm'
  def initiative_state_user_links_draft(initiative)
    edit = edit_users_initiative_path(initiative)
    confirmating = users_initiatives_confirmation_path(initiative)
    delete = users_initiative_path(initiative)
    data = { confirm: t('views.pages.global.confirm') }
    return unless initiative.draft? || initiative.rejected?
    safe_join([
                link_to(t('views.pages.global.button.edit'), edit, class: @warning),
                link_to(t('views.pages.global.button.confirmation'), confirmating, method: :put, class: @success),
                link_to(t('views.pages.global.button.destroy'), delete, method: :delete, data: data, class: @danger)
              ])
  end

  # helper of links for user with initiative state 'draft' or 'confirm'
  def initiative_state_user_links_fundraised(initiative)
    fundraised = users_initiatives_fundraise_path(initiative)
    return unless initiative.fundraising?
    safe_join([link_to(t('controller.initiative.to_fundraised'), fundraised, method: :put, class: @success)])
  end

  private

  # links for confirmating
  def for_confirmating(initiative)
    fundraising = administration_initiatives_fundraise_path(initiative, state: :fundraising)
    rejected = administration_initiatives_rejection_path(initiative)
    safe_join([
                link_to(t('views.pages.global.button.confirmed'), fundraising, method: :put, class: @success),
                link_to(t('views.pages.global.button.rejected'), rejected, method: :put, class: @danger)
              ])
  end

  # links for fundraising
  def for_fundraising(initiative)
    fundraised = administration_initiatives_fundraise_path(initiative, state: :fundraised)
    rejected = administration_initiatives_rejection_path(initiative)
    safe_join([
                link_to(t('views.pages.global.button.fundraised'), fundraised, method: :put, class: @success),
                link_to(t('views.pages.global.button.rejected'), rejected, method: :put, class: @danger)
              ])
  end

  # links for fundraised
  def for_fundraised(initiative)
    implementing = administration_initiatives_implemention_path(initiative, state: :implementing)
    unimplemented = administration_initiatives_implemention_path(initiative, state: :unimplemented)
    safe_join([
                link_to(t('views.pages.global.button.implementing'), implementing, method: :put, class: @success),
                link_to(t('views.pages.global.button.unimplemented'), unimplemented, method: :put, class: @danger)
              ])
  end

  # links for implementing
  def for_implementing(initiative)
    implemented = administration_initiatives_implemention_path(initiative, state: :implemented)
    link_to(t('views.pages.global.button.implemented'), implemented, method: :put, class: @success)
  end

  # liqpay payment for initiative
  def liqpay(liqpay_request)
    return unless current_user
    liqpay_button liqpay_request, title: 'Оплатити'
  end

  # category links
  def category_link(initiative)
    safe_join(category_links_array(initiative))
  end

  # category array of links
  def category_links_array(initiative)
    badge = 'badge badge-light'
    initiative.categories.map { |item| content_tag(:span, link_to(item.title, category_path(item)), class: badge) }
  end

  # all states wich available for administration and moderator
  def collection_administration_states
    states = %i[confirmating fundraising rejected fundraised implementing reporting unimplemented implemented locked]
    states.map { |state| [t("views.pages.global.#{state}"), state] }
  end

  # all states wich available in the cabinet of user
  def collection_user_states
    states = %i[draft confirmating fundraising rejected fundraised]
    states << %i[implementing reporting unimplemented implemented locked]
    states.flatten.map { |state| [t("views.pages.global.#{state}"), state] }
  end

  # all states wich available for all users
  def collection_states
    states = %i[fundraising fundraised implementing reporting unimplemented implemented]
    states.map { |state| [t("views.pages.global.#{state}"), state] }
  end
end
