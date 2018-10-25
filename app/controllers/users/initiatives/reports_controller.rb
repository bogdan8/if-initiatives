# frozen_string_literal: true

module Users
  module Initiatives
    class ReportsController < Users::Initiatives::BaseController
      before_action :find_report, only: %i[update destroy]
      add_breadcrumb I18n.t('.breadcrumb.title'), :users_reports_path

      def create
        @report = current_initiative.reports.build(report_params)
        if @report.save
          redirect_to [:users, :initiatives, initiative_id: params[:initiative_id]], success: t('.success')
        else
          add_breadcrumb t('.breadcrumb.title')
          redirect_to [:users, :initiatives, initiative_id: params[:initiative_id]], error: @report.errors.full_messages.to_sentence
        end
      end

      def update
        if @report.update(report_params)
          redirect_to [:users, :initiatives, current_initiative], success: t('.success')
        else
          add_breadcrumb t('.breadcrumb.title', obj: current_initiative.title)
          redirect_to [:users, :initiatives, current_initiative], error: @report.errors.full_messages.to_sentence
        end
      end

      def destroy
        if @report.destroy
          redirect_to [:users, :initiatives, current_initiative], success: t('.success')
        else
          redirect_to [:users, :initiatives, current_initiative], error: @report.errors.full_messages.to_sentence
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
    end
  end
end
