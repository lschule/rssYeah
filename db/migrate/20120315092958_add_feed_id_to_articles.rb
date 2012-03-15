class AddFeedIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :feed_id, :integer

  end
end
