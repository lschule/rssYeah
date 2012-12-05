class AddFetchColumnToFeeds < ActiveRecord::Migration
  def change
    add_column :feeds, :fetch, :boolean, :default => true

  end
end
