class CreatePointOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :point_options do |t|
      t.string :name
      t.string :type
      t.belongs_to :point, foreign_key: true

      t.timestamps
    end
  end
end
