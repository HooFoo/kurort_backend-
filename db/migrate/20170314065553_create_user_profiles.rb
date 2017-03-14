class CreateUserProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :user_profiles do |t|
      t.belongs_to :user, foreign_key: true
      t.string :name
      t.integer :age
      t.boolean :gender

      t.timestamps
    end
  end
end
