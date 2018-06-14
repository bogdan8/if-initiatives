# frozen_string_literal: true

module AbilityStateToInitiatives
  extend ActiveSupport::Concern

  def initiative_link
    current_user.has_role?(:administration) ? administration_initiatives_path : users_initiatives_path
  end

  def to_confirmating
    if @initiative.to_confirmating
      create_step @initiative
      redirect_to initiative_link, success: t('controller.initiative.to_confirmating')
    else
      redirect_to initiative_link, errors: @initiative.errors.full_messages.to_sentence
    end
  end

  def to_fundraising
    if @initiative.to_fundraising
      @initiative.update(finish_date: Time.current.to_date + @initiative.finish_days) # update finishe date
      create_step @initiative
      redirect_to initiative_link,
                  success: t('controller.initiative.to_fundraising')
    else
      redirect_to initiative_link, error: @initiative.errors.full_messages.to_sentence
    end
  end

  def to_rejected
    if @initiative.to_rejected
      create_step @initiative
      redirect_to initiative_link,
                  success: t('controller.initiative.to_rejected')
    else
      redirect_to initiative_link, error: @initiative.errors.full_messages.to_sentence
    end
  end

  def to_fundraised
    if @initiative.to_fundraised
      create_step @initiative
      redirect_to initiative_link,
                  success: t('controller.initiative.to_fundraised')
    else
      redirect_to initiative_link, error: @initiative.errors.full_messages.to_sentence
    end
  end

  def to_implementing
    if @initiative.to_implementing
      create_step @initiative
      redirect_to initiative_link,
                  success: t('controller.initiative.to_implementing')
    else
      redirect_to initiative_link, error: @initiative.errors.full_messages.to_sentence
    end
  end

  def to_unimplemented
    if @initiative.to_unimplemented
      create_step @initiative
      redirect_to initiative_link,
                  success: t('controller.initiative.to_unimplemented')
    else
      redirect_to initiative_link, error: @initiative.errors.full_messages.to_sentence
    end
  end

  def to_implemented
    if @initiative.to_implemented
      create_step @initiative
      redirect_to initiative_link,
                  success: t('controller.initiative.to_implemented')
    else
      redirect_to initiative_link, error: @initiative.errors.full_messages.to_sentence
    end
  end

  def to_locked
    if @initiative.to_locked
      create_step @initiative
      redirect_to initiative_link, success: t('controller.initiative.to_locked')
    else
      redirect_to initiative_link, error: @initiative.errors.full_messages.to_sentence
    end
  end

  def confirmating
    @initiatives = initiative_with(:confirmating)
  end

  def fundraising
    @initiatives = initiative_with(:fundraising)
  end

  def implementing
    @initiatives = initiative_with(:implementing)
  end

  private

  def initiative_with(state)
    Initiative.with_state(state).includes(:categories, :attachments).page(params[:page]).per(5)
  end

  def create_step(initiative)
    initiative.steps.create(state: initiative.state)
  end
end
