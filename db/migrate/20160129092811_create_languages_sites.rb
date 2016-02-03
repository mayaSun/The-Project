class CreateLanguagesSites < ActiveRecord::Migration
  def change
    create_table :languages_sites do |t|
      t.integer :language_id
      t.integer :site_id
      t.timestamps
    end
  end
end
