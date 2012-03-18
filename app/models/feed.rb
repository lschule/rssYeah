class Feed < ActiveRecord::Base
  has_and_belongs_to_many :users
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
       if entry.published.nil?
         entry.published = Time.now.strftime("%Y-%m-%d")
       end
       article = Article.find_or_initialize_by_guid(entry.id)
       article.update_attributes(
       :name         => entry.title,
       :summary      => entry.summary,
       :url          => entry.url,
       :published    => entry.published,
       :author       => entry.author,
       :guid         => entry.id,
       :feed_id      => self.id
       )
      end
    end

end
