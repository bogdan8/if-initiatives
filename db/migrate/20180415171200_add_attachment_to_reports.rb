class AddAttachmentToReports < ActiveRecord::Migration[5.1]
  def change
    add_reference :attachments, :report, index: true
  end
end
