# frozen_string_literal: true

namespace :initiatives do
  desc 'the check of fundraising completed'
  task is_fundraised: :environment do
    @initiatives = Initiative.fundraising_now
    @initiatives.each do |initiative|
      InitiativeMailer.send_if_fundraised(initiative).deliver_now! if initiative.to_fundraised
    end
  end
end
