class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.text :domains, array: true, default: []
      t.boolean :css, array: true, default: []
      t.text :js, array: true, default: []
      t.text :locales, array: true, default: []
      t.integer :campaign_id
      t.string  :slug
      t.timestamps
    end
  end
end
