# frozen_string_literal: true

module Users
  class IndexPresenter
    def roles
      @roles = Role.all
    end
  end
end
