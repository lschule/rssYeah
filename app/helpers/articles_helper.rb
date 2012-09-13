module ArticlesHelper
  def is_read_or_new(article,uid,last_access)
    @user_article = UserArticle.find_by_user_id_and_article_id(uid,article.id)
    unless @user_article.nil?
      if @user_article.read
        "read"
      elsif article.pubDate > last_access
        "new"
      else
        "unread"
      end 
    else
      if article.pubDate > last_access
        "new"
      else
       "unread"
      end
    end 
  
  end
  
  def is_hearted(aid,uid)
    @user_articles = UserArticle.find_by_user_id_and_article_id(uid,aid)
    unless @user_articles.nil?
      if @user_articles.heart
        "icon-heart"
      else
        "icon-heart-empty"
      end  
    else
       "icon-heart-empty"
    end
  end
end
