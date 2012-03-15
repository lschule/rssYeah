class Article < ActiveRecord::Base
  belongs_to :feed
  
  def feed_name
    feed.name if feed
  end
end
