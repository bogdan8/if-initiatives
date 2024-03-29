# frozen_string_literal: true

module Initiatives
  module StateMachine
    extend ActiveSupport::Concern

    included do
      state_machine initial: :draft do
        event :verify do
          transition %i[draft rejected] => :verifying
        end

        event :fundraise do
          transition verifying: :fundraising
        end

        event :reject do
          transition verifying: :rejected
        end

        event :implement do
          transition fundraising: :implementing
        end

        event :complete do
          transition implementing: :completed
        end

        event :unfulfill do
          transition implementing: :unfulfilled
        end

        event :block do
          transition %i[fundraising implementing] => :blocked
        end

        event :archive do
          transition %i[completed unfulfilled] => :archived
        end
      end
    end
  end
end
