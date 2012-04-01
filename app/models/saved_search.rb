class SavedSearch < ActiveRecord::Base
  belongs_to :user

  def articles
    search_params = {:query => query, :after => last_access, :feeds => user.feeds.collect { |item| item.id }}
    Article.search(search_params)
  end

  def count
    search_params = {:query => query, :after => last_access, :feeds => user.feeds.collect { |item| item.id }}
    Article.count(search_params)
  end

end
