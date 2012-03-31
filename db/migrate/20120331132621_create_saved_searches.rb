class CreateSavedSearches < ActiveRecord::Migration
  def change
    create_table :saved_searches do |t|
      t.string :query
      t.datetime :last_access

      t.timestamps
    end
  end
end
