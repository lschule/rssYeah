class AddNameToSavedSearch < ActiveRecord::Migration
  def change
    add_column :saved_searches, :name, :string

  end
end
