class ChannelsController < ApplicationController
  before_filter :confirm_logged_in
  def index
    @channels = current_user.saved_searches.collect
    @feeds = current_user.feeds.collect
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @channels }
    end    
  end

  def show
    @saved_search = SavedSearch.find(params[:id])
    
    search_params = {}
    search_params[:feeds] = current_user.feeds.collect { |item| item.id }
    search_params[:query] = @saved_search.query
    search_params[:feed_id] = params[:feed_id]  
    search_params[:page] = params[:page]  
    
    logger.debug search_params
    
    if search_params[:feeds].count > 0
      @articles = Article.search(search_params)
    else
      @articles = []
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @articles }
    end
    
  end
end
