class ChannelsController < ApplicationController
  
  def index
    #redirect_to saved_searches_url
    # TODO get saved searches of current user
    @channels = SavedSearch.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @channels }
    end    
  end

  def show
    @saved_search = SavedSearch.find(params[:id])
    
    search_params = {}
    
    #TODO add paging?
    
    search_params[:feeds] = current_user.feeds.collect { |item| item.id }
    search_params[:query] = @saved_search.query
    search_params[:after] = @saved_search.last_access
    
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
