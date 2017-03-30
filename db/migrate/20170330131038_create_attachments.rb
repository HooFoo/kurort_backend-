class CreateAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :attachments do |t|
      t.string :link
      t.belongs_to :comment, foreign_key: true
      t.belongs_to :point, foreign_key: true

      t.timestamps
    end
  end
end
