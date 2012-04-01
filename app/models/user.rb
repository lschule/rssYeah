class User < ActiveRecord::Base
  has_and_belongs_to_many :feeds
  has_many :user_articles
  has_many :articles, :through => :user_articles
  has_many :saved_searches
  acts_as_authentic
end
