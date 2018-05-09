# frozen_string_literal: true

module InitiativesHelper
  def initialize(*)
    super
    @success = 'btn btn-success btn-sm'
    @danger = 'btn btn-danger btn-sm'
    @warning = 'btn btn-warning btn-sm'
  end

  # helper to count how much time passed after adding
  def added_time(initiative)
    TimeDifference.between(initiative.created_at, Time.now).humanize
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

  # helper of links for user
  def initiative_state_user_links(initiative)
    edit = edit_users_initiative_path(initiative)
    confirmating = to_confirmating_users_initiative_path(initiative)
    delete = users_initiative_path(initiative)
    data = { confirm: t('views.pages.global.confirm') }
    return unless initiative.draft? || initiative.rejected?
    safe_join([
                link_to(t('views.pages.global.button.edit'), edit, class: @warning),
                link_to(t('views.pages.global.button.confirmation'), confirmating, class: @success),
                link_to(t('views.pages.global.button.destroy'), delete, method: :delete, data: data, class: @danger)
              ])
  end

  # helper for locked initiative
  def to_locked(initiative)
    return if initiative.locked?
    locked = to_locked_administration_initiative_path(initiative)
    link_to(t('views.pages.global.button.locked'), locked, class: @danger)
  end

  private

  # links for confirmating
  def for_confirmating(initiative)
    fundraising = to_fundraising_administration_initiative_path(initiative)
    rejected = to_rejected_administration_initiative_path(initiative)
    safe_join([
                link_to(t('views.pages.global.button.confirmed'), fundraising, class: @success),
                link_to(t('views.pages.global.button.rejected'), rejected, class: @danger)
              ])
  end

  # links for fundraising
  def for_fundraising(initiative)
    fundraised = to_fundraised_administration_initiative_path(initiative)
    rejected = to_rejected_administration_initiative_path(initiative)
    safe_join([
                link_to(t('views.pages.global.button.fundraised'), fundraised, class: @success),
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
end
