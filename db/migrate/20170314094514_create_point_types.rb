class CreatePointTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :point_types do |t|
      t.string :name
      t.string :icon

      t.timestamps
    end
    add_reference :points, :point_type, index: true
    add_foreign_key :points, :point_types
    add_reference :point_options, :point_type, index: true
    add_foreign_key :point_options, :point_types
  end
end
