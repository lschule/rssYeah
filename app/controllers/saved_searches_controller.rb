class SavedSearchesController < ApplicationController
  # GET /saved_searches
  # GET /saved_searches.json
  def index
    @saved_searches = SavedSearch.all
    @new_articles = {}
    @saved_searches.each do |saved_search|
      @new_articles[saved_search.id] = 15
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @saved_searches }
    end
  end

  # GET /saved_searches/1
  # GET /saved_searches/1.json
  def show
    @saved_search = SavedSearch.find(params[:id])

#    @saved_search.last_access = Time.now
#    @saved_search.save()
#    redirect_to saved_searches_url and return
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @saved_search }
    end
  end

#  def access
#    @saved_search = SavedSearch.find(params[:id])

#    @saved_search.last_access = Time.now
#    @saved_search.save()
#    redirect_to saved_searches_url and return
#  end

  # GET /saved_searches/new
  # GET /saved_searches/new.json
  def new
    @saved_search = SavedSearch.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @saved_search }
    end
  end

  # GET /saved_searches/1/edit
  def edit
    @saved_search = SavedSearch.find(params[:id])
  end

  # POST /saved_searches
  # POST /saved_searches.json
  def create
    @saved_search = SavedSearch.new(params[:saved_search])

    respond_to do |format|
      if @saved_search.save
        format.html { redirect_to @saved_search, notice: 'Saved search was successfully created.' }
        format.json { render json: @saved_search, status: :created, location: @saved_search }
      else
        format.html { render action: "new" }
        format.json { render json: @saved_search.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /saved_searches/1
  # PUT /saved_searches/1.json
  def update
    @saved_search = SavedSearch.find(params[:id])

    respond_to do |format|
      if @saved_search.update_attributes(params[:saved_search])
        format.html { redirect_to @saved_search, notice: 'Saved search was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @saved_search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /saved_searches/1
  # DELETE /saved_searches/1.json
  def destroy
    @saved_search = SavedSearch.find(params[:id])
    @saved_search.destroy

    respond_to do |format|
      format.html { redirect_to saved_searches_url }
      format.json { head :no_content }
    end
  end
end
