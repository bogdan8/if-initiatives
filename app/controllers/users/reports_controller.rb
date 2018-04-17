# frozen_string_literal: true

module Users
  class ReportsController < ApplicationController
    load_and_authorize_resource :initiative, find_by: :slug
    load_and_authorize_resource :report, through: :initiative

    def create
      @initiative = Initiative.friendly.find(params[:initiative_id])
      @report = @initiative.reports.build(report_params)
      if @report.save
        redirect_to users_initiative_path(params[:initiative_id]), success: t('controller.report.save')
      else
        redirect_to users_initiative_path(params[:initiative_id]), error: @report.errors.full_messages.to_sentence
      end
    end

    def update
      if @report.update(report_params)
        redirect_to [:users, @initiative], success: t('controller.report.update')
      else
        redirect_to [:users, @initiative], error: @report.errors.full_messages.to_sentence
      end
    end

    def destroy
      if @report.destroy
        redirect_to [:users, @initiative], success: t('controller.report.destroy')
      else
        redirect_to [:users, @initiative], error: @report.errors.full_messages.to_sentence
      end
    end

    private

    def report_params
      text = %i[title description]
      attachments = %i[id image video _destroy]
      params.require(:report).permit(*text, attachments_attributes: [*attachments])
    end
  end
end
