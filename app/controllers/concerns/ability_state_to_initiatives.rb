# frozen_string_literal: true

module AbilityStateToInitiatives
  extend ActiveSupport::Concern

  def for_confirmation
    if @initiative.submit_for_confirmation!
      redirect_to users_initiatives_path, success: t('controller.initiative.for_confirmation')
    else
      flash[:error] = @initiative.errors.full_messages.to_sentence
    end
  end

  def success_confirmation
    if @initiative.success_confirmation!
      redirect_to pending_approval_administration_initiatives_path,
                  success: t('controller.initiative.success_confirmation')
    else
      flash[:error] = @initiative.errors.full_messages.to_sentence
    end
  end

  def error_confirmation
    if @initiative.error_confirmation!
      redirect_to pending_approval_administration_initiatives_path,
                  success: t('controller.initiative.error_confirmation')
    else
      flash[:error] = @initiative.errors.full_messages.to_sentence
    end
  end

  def finish_fundraising
    if @initiative.finish_fundraising!
      redirect_to pending_approval_administration_initiatives_path,
                  success: t('controller.initiative.success_confirmation')
    else
      flash[:error] = @initiative.errors.full_messages.to_sentence
    end
  end

  def started_implement
    if @initiative.started_implement!
      redirect_to fundraising_finished_administration_initiatives_path,
                  success: t('controller.initiative.started_implement_success')
    else
      flash[:error] = @initiative.errors.full_messages.to_sentence
    end
  end

  def insufficient_funds
    if @initiative.insufficient_funds!
      redirect_to fundraising_finished_administration_initiatives_path,
                  success: t('controller.initiative.insufficient_funds')
    else
      flash[:error] = @initiative.errors.full_messages.to_sentence
    end
  end

  def check_implemented
    if @initiative.check_implemented!
      redirect_to audit_implemented_administration_initiatives_path,
                  success: t('controller.initiative.check_implemented')
    else
      flash[:error] = @initiative.errors.full_messages.to_sentence
    end
  end

  def implemented
    if @initiative.finish_fundraiser_success!
      redirect_to audit_implemented_administration_initiatives_path,
                  success: t('controller.initiative.implemented')
    else
      flash[:error] = @initiative.errors.full_messages.to_sentence
    end
  end

  def unrealized
    if @initiative.finish_fundraiser_errors!
      redirect_to audit_implemented_administration_initiatives_path,
                  success: t('controller.initiative.unrealized')
    else
      flash[:error] = @initiative.errors.full_messages.to_sentence
    end
  end

  def locked
    if @initiative.locked_forever!
      redirect_to administration_initiatives_path, success: t('controller.initiative.locked')
    else
      flash[:error] = @initiative.errors.full_messages.to_sentence
    end
  end

  def fundraising_finished
    @initiatives = initiative_with(:fundraising_finished)
  end

  def pending_approval
    @initiatives = initiative_with(:pending_approval)
  end

  def report
    @initiatives = initiative_with(:being_implemented)
  end

  def audit_implemented
    @initiatives = initiative_with(:audit_implemented)
  end

  private

  def initiative_with(state)
    Initiative.with_state(state).includes(:categories).page(params[:page]).per(5)
  end
end
