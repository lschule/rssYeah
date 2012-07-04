class RecommendationsController < ApplicationController
  # GET /recommendations
  # GET /recommendations.json
  def index
    #@recommendations = Recommendation.all
    @recommendations = current_user.recommendations
    @article_ids = @recommendations.collect { |rec| rec.article_id }
    @articles = Article.find_all_by_id(@article_ids, :order => 'published DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @recommendations }
    end
  end

  # GET /recommendations/1
  # GET /recommendations/1.json
  def show
    @recommendation = Recommendation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @recommendation }
    end
  end

  # GET /recommendations/new
  # GET /recommendations/new.json
  def new
    @recommendation = Recommendation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @recommendation }
    end
  end

  # GET /recommendations/1/edit
  def edit
    @recommendation = Recommendation.find(params[:id])
  end

  # POST /recommendations
  # POST /recommendations.json
  def create
    @recommendation = Recommendation.new(params[:recommendation])

    respond_to do |format|
      if @recommendation.save
        format.html { redirect_to @recommendation, notice: 'Recommendation was successfully created.' }
        format.json { render :json => @recommendation, status: :created, location: @recommendation }
      else
        format.html { render action: "new" }
        format.json { render :json => @recommendation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recommendations/1
  # PUT /recommendations/1.json
  def update
    @recommendation = Recommendation.find(params[:id])

    respond_to do |format|
      if @recommendation.update_attributes(params[:recommendation])
        format.html { redirect_to @recommendation, notice: 'Recommendation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render :json => @recommendation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recommendations/1
  # DELETE /recommendations/1.json
  def destroy
    @recommendation = Recommendation.find(params[:id])
    @recommendation.destroy

    respond_to do |format|
      format.html { redirect_to recommendations_url }
      format.json { head :no_content }
    end
  end
end
