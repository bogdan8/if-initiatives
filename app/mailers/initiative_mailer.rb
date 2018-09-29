# frozen_string_literal: true

class InitiativeMailer < ApplicationMailer
  def send_implement(initiative)
    @initiative = initiative
    mail(to: @initiative.user.email, subject: t('mail.initiative.implement.subject'))
  end
end
