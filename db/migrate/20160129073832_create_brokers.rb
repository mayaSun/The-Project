class CreateBrokers < ActiveRecord::Migration
  def change
    create_table :brokers do |t|
      t.string   :name
      t.integer  :leads_per_day
      t.string   :slug
      t.timestamps
    end
  end
end
