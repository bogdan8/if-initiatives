# frozen_string_literal: true

module Administration
  class HomeController < Administration::BaseController
    def index
      @initiatives_count = Initiative.count
      @initiatives = Initiative.includes(:categories).without_draft.last(3)
      @users_count = User.count
      @subscriptions_count = Subscription.count
      @categories_count = Category.count
    end
  end
end

