module ArticlesHelper
  def is_read(aid,uid)
    @user_articles = UserArticle.find_by_user_id_and_article_id(uid,aid)
    unless @user_articles.nil?
      if @user_articles.read
        "read"
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
    end 
  end
end
