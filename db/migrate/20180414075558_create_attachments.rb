class CreateAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :attachments do |t|
      t.attachment :image
      t.attachment :video
      t.references :initiative, foreign_key: true

      t.timestamps
    end
  end
end
