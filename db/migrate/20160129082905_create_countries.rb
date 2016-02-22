class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string  :code
      t.string  :name
      t.string  :phone_country_code
      t.integer :rate
    end
  end
end
