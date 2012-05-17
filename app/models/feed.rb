module Feedzirra
  module Parser
    class NatureRSSEntry
      include SAXMachine
      include FeedEntryUtilities
      element :title
      element :"feedburner:origLink", :as => :url
      element :link, :as => :url
      elements :"dc:creator", :as => :authors
      element :"dc:date", :as => :published
      element :"dc:source", :as => :source
      element :"prism:doi", :as => :doi
      element :"prism:section", :as => :section
      element :"content:encoded", :as => :content
      element :description, :as => :summary
      element :"dcterms:modified", :as => :updated
      element :guid, :as => :entry_id
      def url
        @url || @link
      end
      def author
        authors.join(', ')
      end
    end
  end
end

module Feedzirra
  module Parser
    class NatureRSS
      include SAXMachine
      include FeedUtilities
      element :title
      element :description
      element :link, :as => :url
      elements :item, :as => :entries, :class => NatureRSSEntry

      attr_accessor :feed_url

      def self.able_to_parse?(xml) #:nodoc:
        /nature\.com/ =~ xml
        #true
      end
    end
  end
end

Feedzirra::Feed.add_feed_class(Feedzirra::Parser::NatureRSS)

class Feed < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :articles
  
  def self.load_all_feeds()
    Feed.all.each do |feed|
      feed.update_articles();      
    end
  end
  
  def update_articles()
    #Feedzirra::Feed.add_common_feed_entry_element("dc:date", :as => :published)
    feedzirra = Feedzirra::Feed.fetch_and_parse(self.url)
    add_articles(feedzirra.entries)
  end

  def add_articles(entries)
    entries.each do |entry|
      if entry.published.nil?
        entry.published = Time.now.strftime("%Y-%m-%d")
      end
      old_article = Article.where(:guid => entry.id).exists?
      article = Article.find_or_initialize_by_guid(entry.id)
      article.update_attributes(
        :name         => entry.title,
        :summary      => entry.summary,
        :url          => entry.url,
        :author       => entry.author,
        :guid         => entry.id,
        :feed_id      => self.id
      )
      if !old_article
        article.update_attributes(:published => entry.published)
      end
    end
  end

end
