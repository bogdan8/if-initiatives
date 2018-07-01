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
    rejected = to_rejected_administration_initiative_path(initiative)
    safe_join([
                link_to(t('views.pages.global.button.confirmed'), fundraising, method: :put, class: @success),
                link_to(t('views.pages.global.button.rejected'), rejected, class: @danger)
              ])
  end

  # links for fundraising
  def for_fundraising(initiative)
    fundraised = administration_initiatives_fundraise_path(initiative, state: :fundraised)
    rejected = to_rejected_administration_initiative_path(initiative)
    safe_join([
                link_to(t('views.pages.global.button.fundraised'), fundraised, method: :put, class: @success),
                link_to(t('views.pages.global.button.rejected'), rejected, class: @danger)
              ])
  end

  # links for fundraised
  def for_fundraised(initiative)
    implementing = to_implementing_administration_initiative_path(initiative)
    unimplemented = to_unimplemented_administration_initiative_path(initiative)
    safe_join([
                link_to(t('views.pages.global.button.implementing'), implementing, class: @success),
                link_to(t('views.pages.global.button.unimplemented'), unimplemented, class: @danger)
              ])
  end

  # links for implementing
  def for_implementing(initiative)
    implemented = to_implemented_administration_initiative_path(initiative)
    link_to(t('views.pages.global.button.implemented'), implemented, class: @success)
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
    initiative.categories.map { |category| content_tag(:li, link_to(category.title, category_path(category))) }
  end

  # all states wich available for administration and moderator
  def collection_administration_states
    states = %i[confirmating fundraising rejected fundraised implementing reporting unimplemented implemented locked]
    states.map { |state| [t("views.pages.global.#{state}"), state] }
  end

  # all states wich available in the cabinet of user
  def collection_user_states
    states = %i[draft confirmating fudcraising rejected fundraised]
    states << %i[implementing reporting unimplemented implemented locked]
    states.map { |state| [t("views.pages.global.#{state}"), state] }
  end

  # all states wich available for all users
  def collection_states
    states = %i[fundraising fundraised implementing reporting unimplemented implemented]
    states.map { |state| [t("views.pages.global.#{state}"), state] }
  end
end
