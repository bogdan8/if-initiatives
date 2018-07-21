# frozen_string_literal: true

module Administration
  class CommentsController < Administration::BaseController
    load_and_authorize_resource
    before_action :find_initiative, only: %i(destroy)

    def destroy
      @comment.destroy
      redirect_to [:administration, @initiative], success: t('controller.comment.destroy')
    end

    private

    def find_initiative
      @initiative = Initiative.find(params[:initiative_id])
    end
  end
end
