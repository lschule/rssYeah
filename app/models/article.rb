class Article < ActiveRecord::Base
  belongs_to :feed, :inverse_of => :articles
  has_many :user_articles
  has_many :users, :through => :user_articles

  include Tire::Model::Search
  include Tire::Model::Callbacks

  def self.search(params)
    tire.search(load: true, page: params[:page], per_page: 30) do
      #query { string params[:query], default_operator: "AND" } if params[:query].present?
      #filter :range, published_at: {lte: Time.zone.now}
      query do
        boolean do
          must { terms :feed_id, params[:feeds] } if params[:feeds].present?
          must { string params[:query], default_operator: "AND" } if params[:query].present?
          must { range :published, gte: params[:after] } if params[:after].present?
          must { term :feed_id, params[:feed_id] } if params[:feed_id].present?
        end
      end if params[:query].present? or params[:feed_id].present? or params[:feeds].present?
      sort { by :published, 'desc' }
      facet "feeds" do
        terms :feed_id
      end
      #raise to_curl
    end
  end

  def self.count(params)
    s = tire.search :search_type => 'count' do
      query do
        boolean do
          must { terms :feed_id, params[:feeds] } if params[:feeds].present?
          must { string params[:query], default_operator: "AND" } if params[:query].present?
          must { range :published, gte: params[:after] } if params[:after].present?
          must { term :feed_id, params[:feed_id] } if params[:feed_id].present?
        end
      end if params[:query].present? or params[:feed_id].present? or params[:feeds].present?
      # we could also return facets
      #facet "feeds" do
      #  terms :feed_id
      #end
      #raise to_curl
    end
    s.total
  end
    
  def feed_name
    feed.name if feed
  end

  def feed_short
    feed.shortname if feed
  end
 
end
