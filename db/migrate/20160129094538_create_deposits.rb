class CreateDeposits < ActiveRecord::Migration
  def change
    create_table :deposits do |t|
      t.integer :brokers_lead_id
      t.integer :amount
      t.string :currency
      t.timestamps
    end
  end
end
