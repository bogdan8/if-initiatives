# frozen_string_literal: true

module Administrations
  class IndexPresenter
    def initiatives_count
      Initiative.without_draft.count
    end

    def initiatives
      Initiative.includes(:categories).without_draft.last(3)
    end

    def users_count
      User.count
    end

    def subscriptions_count
      Subscription.count
    end

    def categories_count
      Category.count
    end
  end
end
