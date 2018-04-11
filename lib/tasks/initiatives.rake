# frozen_string_literal: true

namespace :initiatives do
  desc 'Populate the table Song with songs'
  task is_fundraised: :environment do
    @initiatives = Initiative.fundraising_now
    @initiatives.each do |initiative|
      InitiativeMailer.send_if_fundraised(initiative).deliver_now! if initiative.to_fundraised
    end
  end
end
