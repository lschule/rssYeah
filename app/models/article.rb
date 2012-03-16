class Article < ActiveRecord::Base
  belongs_to :feed
  has_many :user_articles
  
  def feed_name
    feed.name if feed
  end
end
