class AddLangKeyToLangs < ActiveRecord::Migration[5.0]
  def change
    add_column :langs, :key, :string, index: true
  end
end
