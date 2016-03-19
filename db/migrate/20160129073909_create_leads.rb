class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string   :name
      t.string   :email
      t.string   :phone
      t.integer  :site_id
      t.integer  :country_id
      t.integer  :language_id
      t.string   :ctoption_password
      t.integer  :account_balance
      t.string   :currency
      t.string   :from_db  
      t.timestamps
    end
  end
end
