class CreateCampaign < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name
      t.string  :slug
      t.timestamps
    end
  end
end
