class CreateBrokersCountries < ActiveRecord::Migration
  def change
    create_table :brokers_countries do |t|
      t.integer :broker_id
      t.integer :country_id
      t.timestamps
    end
  end
end
