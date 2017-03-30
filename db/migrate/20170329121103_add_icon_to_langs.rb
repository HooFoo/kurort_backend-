class AddIconToLangs < ActiveRecord::Migration[5.0]
  def change
    add_column :langs, :icon, :string
  end
end
