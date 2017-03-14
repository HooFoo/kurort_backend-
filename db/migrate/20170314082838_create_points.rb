class CreatePoints < ActiveRecord::Migration[5.0]
  def change
    create_table :points do |t|
      t.belongs_to :user, foreign_key: true
      t.float :lat
      t.float :lng
      t.string :name
      t.string :description
      t.json :options

      t.timestamps
    end
  end
end
