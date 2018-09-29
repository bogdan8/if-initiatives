# frozen_string_literal: true

namespace :initiatives do
  desc 'the check of fundraising completed'
  task is_fundraised: :environment do
    @initiatives = Initiative.fundraising_now
    @initiatives.each do |initiative|
      InitiativeMailer.send_implement(initiative).deliver_now! if initiative.implement
    end
  end
end
