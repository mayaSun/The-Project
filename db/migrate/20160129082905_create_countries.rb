class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :country_code
      t.string :name
      t.integer :rate
    end
  end
end
