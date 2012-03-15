class Feed < ActiveRecord::Base
  has_many :articles
  
  def self.load_all_feeds()
    Feed.all.each do |feed|
      feed.update_articles();      
    end
  end
  
  def update_articles()
      feedzirra = Feedzirra::Feed.fetch_and_parse(self.url)
      add_articles(feedzirra.entries)
  end

    def add_articles(entries)
      entries.each do |entry|
       article = Article.find_or_initialize_by_guid(entry.id)
       article.update_attributes(
       :name         => entry.title,
       :summary      => entry.summary,
       :url          => entry.url,
       :published_at => entry.published,
       :guid         => entry.id,
       :feed_id      => self.id
       )
      end
    end

end
