# frozen_string_literal: true

module AbilityStateToInitiatives
  extend ActiveSupport::Concern

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
end
