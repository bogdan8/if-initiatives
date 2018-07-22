# frozen_string_literal: true

module Categories
  class ShowPresenter
    def initialize(category)
      @category = category
    end

    def initiatives
      states = %i[draft confirmating rejected locked]
      Initiative.available_everyone(states).by_category(@category)
    end
  end
end
