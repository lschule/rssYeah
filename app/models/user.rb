class User < ActiveRecord::Base
  has_and_belongs_to_many :feeds
  has_many :user_articles
  has_many :articles, :through => :user_articles
  has_many :saved_searches
  has_many :recommendations, :foreign_key => :to_id
  has_many :made_recommendations, :class_name => "Recommendation", :foreign_key => :from_id
  acts_as_authentic
end
