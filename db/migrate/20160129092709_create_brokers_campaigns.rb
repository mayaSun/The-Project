class CreateBrokersCampaigns < ActiveRecord::Migration
  def change
    create_table :brokers_campaigns do |t|
      t.integer :broker_id
      t.integer :campaign_id
      t.timestamps
    end
  end
end
