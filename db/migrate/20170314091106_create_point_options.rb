class CreatePointOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :point_options do |t|
      t.string :name
      t.string :type_name

      t.timestamps
    end
  end
end
