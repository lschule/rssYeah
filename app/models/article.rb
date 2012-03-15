class Article < ActiveRecord::Base
  belongs_to :feed

  def self.load_fixture()
    update_from_feed("http://rsbl.royalsocietypublishing.org/rss/current.xml");
  end
  
  def self.load_all_feeds()
    Feed.all.each do |feed|
      update_from_feed(feed);      
    end
  end
  
  def self.update_from_feed(feed)
      feedzirra = Feedzirra::Feed.fetch_and_parse(feed.url)
      add_entries(feedzirra.entries,feed.id)
    end

    def self.update_from_feed_continuously(feed,delay_interval = 15.minutes)
      feedzirra = Feedzirra::Feed.fetch_and_parse(feed.url)
      add_entries(feedzirra.entries,feed.id)
      loop do
        sleep delay_interval
        feedzirra = Feedzirra::Feed.update(feedzirra)
        add_entries(feedzirra.new_entries,feed.id) if feedzirra.updated?
      end
    end

    private

    def self.add_entries(entries,feed_id)
      entries.each do |entry|
        unless exists? :guid => entry.id
          create!(
            :name         => entry.title,
            :summary      => entry.summary,
            :url          => entry.url,
            :published_at => entry.published,
            :guid         => entry.id,
            :feed_id      => feed_id
          )
        end
      end
    end
end
