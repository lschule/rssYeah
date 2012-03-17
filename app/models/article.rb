class Article < ActiveRecord::Base
  belongs_to :feed
  has_many :user_articles
  has_many :users, :through => :user_articles

  include Tire::Model::Search
  include Tire::Model::Callbacks

  def self.search(params)
    tire.search(load: true) do
      query { string params[:query], default_operator: "AND" } if params[:query].present?
      #filter :range, published_at: {lte: Time.zone.now}
    end
  end
    
  def feed_name
    feed.name if feed
  end
 
end
