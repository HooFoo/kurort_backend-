class CreateLangs < ActiveRecord::Migration[5.0]
  def change
    create_table :langs do |t|
      t.string :name

      t.timestamps
    end
    add_reference :users, :lang, index: true
    add_foreign_key :users, :langs
  end
end
