class SavedSearch < ActiveRecord::Base

  def articles
    search_params = {:query => query, :after => last_access}
    Article.search(search_params)
  end

  def count
    search_params = {:query => query, :after => last_access}
    Article.count(search_params)
  end

end
