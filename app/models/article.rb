class Article < ActiveRecord::Base
  belongs_to :feed
  has_many :user_articles
  has_many :users, :through => :user_articles

  include Tire::Model::Search
  include Tire::Model::Callbacks

  def self.search(params)
    tire.search(load: true, page: params[:page], per_page: 10) do
      #query { string params[:query], default_operator: "AND" } if params[:query].present?
      #filter :range, published_at: {lte: Time.zone.now}
      query do
        boolean do
          must { terms :feed_id, params[:user_feeds] } if params[:user_feeds].present?
          must { string params[:query], default_operator: "AND" } if params[:query].present?
          #must { range :published_at, lte: Time.zone.now }
          must { term :feed_id, params[:feed_id] } if params[:feed_id].present?
        end
      end if params[:query].present? or params[:feed_id].present? or params[:user_feeds].present?
      facet "feeds" do
        terms :feed_id
      end
      #raise to_curl
    end
  end
    
  def feed_name
    feed.name if feed
  end
 
end
