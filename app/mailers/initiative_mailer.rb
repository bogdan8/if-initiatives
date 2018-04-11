# frozen_string_literal: true

class InitiativeMailer < ApplicationMailer
  def send_is_fundraised(initiative)
    @initiative = initiative
    mail(to: @initiative.user.email, subject: 'Дата збору коштів завершено.')
  end
end
