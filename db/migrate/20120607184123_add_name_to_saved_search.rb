class AddNameToSavedSearch < ActiveRecord::Migration
  def change
    add_column :saved_searches, :name, :string, :default => "default name"

  end
end
