class AddFetchColumnToFeeds < ActiveRecord::Migration
  def change
    add_column :feeds, :fetch, :boolean, :default => 1

  end
end
