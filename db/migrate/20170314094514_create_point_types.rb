class CreatePointTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :point_types do |t|
      t.string :name
      t.belongs_to :point, foreign_key: true
      t.string :icon

      t.timestamps
    end
  end
end
