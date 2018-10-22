# frozen_string_literal: true

module Users
  module Initiatives
    class ReportsController < Users::Initiatives::BaseController
      before_action :find_initiative, only: %i[create]
      before_action :find_report, only: %i[update destroy]
      add_breadcrumb I18n.t('.breadcrumb.title'), :users_reports_path

      def create
        @report = @initiative.reports.build(report_params)
        if @report.save
          redirect_to users_initiative_path(params[:initiative_id]), success: t('.success')
        else
          add_breadcrumb t('.breadcrumb.title')
          redirect_to users_initiative_path(params[:initiative_id]), error: @report.errors.full_messages.to_sentence
        end
      end

      def update
        if @report.update(report_params)
          redirect_to [:users, :initiative, @initiative], success: t('.success')
        else
          add_breadcrumb t('.breadcrumb.title', obj: @initiative.title)
          redirect_to [:users, :initiative, @initiative], error: @report.errors.full_messages.to_sentence
        end
      end

      def destroy
        if @report.destroy
          redirect_to [:users, :initiative, @initiative], success: t('.success')
        else
          redirect_to [:users, :initiative, @initiative], error: @report.errors.full_messages.to_sentence
        end
      end

      private

      def find_report
        @report = Report.find(params[:id])
      end

      def report_params
        text = %i[title description]
        attachments = %i[id image video _destroy]
        params.require(:report).permit(*text, attachments_attributes: [*attachments])
      end

      def find_initiative
        @initiative = Initiative.friendly.find(params[:initiative_id])
      end
    end
  end
end
