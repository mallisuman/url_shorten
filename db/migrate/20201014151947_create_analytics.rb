class CreateAnalytics < ActiveRecord::Migration[5.2]
  def change
    create_table :analytics do |t|
      t.integer :count_click
      t.string :ip_address
      t.string :country
      t.string :link_id
    end
  end
end
