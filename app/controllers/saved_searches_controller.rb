class SavedSearchesController < ApplicationController
  before_filter :confirm_logged_in
  # GET /saved_searches
  # GET /saved_searches.json
  def index
    @saved_searches = SavedSearch.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @saved_searches }
    end
  end

  # GET /saved_searches/1
  # GET /saved_searches/1.json
  def show
    @saved_search = SavedSearch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @saved_search }
    end
  end

  # GET /saved_searches/new
  # GET /saved_searches/new.json
  def new
    @saved_search = SavedSearch.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @saved_search }
    end
  end

  # GET /saved_searches/1/edit
  def edit
    @saved_search = SavedSearch.find(params[:id])
  end

  # POST /saved_searches
  # POST /saved_searches.json
  def create
    unless params[:saved_search].nil?
      @saved_search = SavedSearch.new(params[:saved_search])
    else
      @saved_search = SavedSearch.new();
      @saved_search.query = params[:query];
      @saved_search.name = params[:name];
    end
    @saved_search.user = current_user
    @saved_search.last_access = DateTime.new(1990,1,1)
    respond_to do |format|
      if @saved_search.save
        format.html { redirect_to channel_url(@saved_search), :notice => 'Your channel was successfully created.' }
        format.json { render :json => @saved_search, :status => :created, :location => @saved_search }
      else
        format.html { render :action => "new" }
        format.json { render :json => @saved_search.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /saved_searches/1
  # PUT /saved_searches/1.json
  def update
    @saved_search = SavedSearch.find(params[:id])

    respond_to do |format|
      @saved_search.name = params[:name]
      @saved_search.query = params[:query]
      if @saved_search.save
        format.html { redirect_to :channels, :notice => 'Your channel was successfully saved.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @saved_search.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /saved_searches/1
  # DELETE /saved_searches/1.json
  def destroy
    @saved_search = SavedSearch.find(params[:id])
    @saved_search.destroy

    respond_to do |format|
      format.html { head :no_content }
      format.json { head :no_content }
    end
  end
  
  def update_last_access
    @saved_search = SavedSearch.find(params[:id])
    @saved_search.update_attributes({:last_access => Time.now.strftime("%Y-%m-%d %H:%M:%S")})
    respond_to do |format|
      format.json { head :ok }
    end
  end
end
