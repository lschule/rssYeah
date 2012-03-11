class CreateSmartCategories < ActiveRecord::Migration
  def change
    create_table :smart_categories do |t|
      t.string :name
      t.string :query

      t.timestamps
    end
  end
end
