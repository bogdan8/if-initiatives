# frozen_string_literal: true

module Initiatives
  module StateMachine
    extend ActiveSupport::Concern

    included do
      state_machine initial: :draft do
        event :to_confirmating do
          transition %i(draft rejected) => :confirmating
        end

        event :to_fundraising do
          transition confirmating: :fundraising
        end

        event :to_rejected do
          transition %i(confirmating fundraising) => :rejected
        end

        event :to_fundraised do
          transition fundraising: :fundraised
        end

        event :to_implementing do
          transition fundraised: :implementing
        end

        event :to_implemented do
          transition implementing: :implemented
        end

        event :to_unimplemented do
          transition fundraised: :unimplemented
        end

        event :to_locked do
          transition all - %i(locked implemented unimplemented) => :locked
        end
      end
    end
  end
end
