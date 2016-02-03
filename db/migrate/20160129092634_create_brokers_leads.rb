class CreateBrokersLeads < ActiveRecord::Migration
  def change
    create_table :brokers_leads do |t|
      t.integer :broker_id
      t.integer :lead_id
      t.timestamps
    end
  end
end
