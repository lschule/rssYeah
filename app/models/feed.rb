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
    class PLoSRSSEntry
      include SAXMachine
      include FeedEntryUtilities
      element :title
      element :name, :as => :author
      element :"feedburner:origLink", :as => :url
      element :content, :as => :summary
      element :published
      element :id, :as => :entry_id
      element :issued, :as => :published
      element :created, :as => :published
      element :updated
      element :modified, :as => :updated
      elements :category, :as => :categories, :value => :term
      elements :link, :as => :links, :value => :href
      def url
        @url || @link
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

module Feedzirra
  module Parser
    class PLoSRSS
      include SAXMachine
      include FeedUtilities
      element :title
      elements :entry, :as => :entries, :class => PLoSRSSEntry
      attr_accessor :feed_url
      def self.able_to_parse?(xml) #:nodoc:
        /plos\.org/ =~ xml
        #true
      end
    end
  end
end

Feedzirra::Feed.add_feed_class(Feedzirra::Parser::NatureRSS)
Feedzirra::Feed.add_feed_class(Feedzirra::Parser::PLoSRSS)


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
    #if (feedzirra != 0)
    if feedzirra
      add_articles(feedzirra.entries)
    end
    
  end

  def add_articles(entries)
    if entries
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

end
