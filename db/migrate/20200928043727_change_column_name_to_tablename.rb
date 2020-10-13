class ChangeColumnNameToTablename < ActiveRecord::Migration[5.2]
  def change
    rename_column :links, :text, :original_url
  end
end
