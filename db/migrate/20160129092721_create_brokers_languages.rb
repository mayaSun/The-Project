class CreateBrokersLanguages < ActiveRecord::Migration
  def change
    create_table :brokers_languages do |t|
      t.integer :language_id
      t.integer :broker_id
      t.string  :slug
      t.timestamps
    end
  end
end
