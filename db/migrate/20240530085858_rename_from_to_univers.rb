class RenameFromToUnivers < ActiveRecord::Migration[7.1]
  def change
    rename_column :characters, :from, :univers
  end
end
