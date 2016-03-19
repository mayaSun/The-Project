class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.string :url
      t.integer :campaign_id
      t.string  :slug
      t.timestamps
    end
  end
end
