# frozen_string_literal: true

module Categories
  class ShowPresenter
    def initialize(category)
      @category = category
    end

    def initiatives
      Initiative.available_everyone.by_category(@category)
    end
  end
end
