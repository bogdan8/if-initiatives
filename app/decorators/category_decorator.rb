# frozen_string_literal: true

class CategoryDecorator < ApplicationDecorator
  delegate_all

  def get_initiatives
    initiatives.map { |categorization| categorization.initiative.state.draft? || categorization.initiative.state.confirmating? || categorization.initiative.state.locked? || categorization.initiative.state.rejected? }
  end
end
