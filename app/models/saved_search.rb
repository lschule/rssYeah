class SavedSearch < ActiveRecord::Base
  belongs_to :user

  def count
    feeds = user.feeds.collect { |item| item.id }
    if feeds.count > 0
      search_params = {:query => query, :after => last_access, :feeds => feeds}
      Article.count(search_params)
    else
      0
    end
  end

end
