class CreateUserProfilePointTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :user_profile_point_types do |t|
      t.belongs_to :user_profile, foreign_key: true
      t.belongs_to :point_type, foreign_key: true
      t.boolean :enabled
    end
  end
end
