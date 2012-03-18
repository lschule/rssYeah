class ArticlesController < ApplicationController
  before_filter :confirm_logged_in
  # GET /articles
  # GET /articles.json
  def index
    params[:user_feeds] = current_user.feeds.collect { |item| item.id }
    if params[:user_feeds].count > 0
      @articles = Article.search(params)
    else
      @articles = []
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(params[:article])

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, :notice => 'Article was successfully created.' }
        format.json { render :json => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        format.json { render :json => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to @article, :notice => 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end  
  
  def toggle_heart
    @user_articles = UserArticle.find_or_initialize_by_user_id_and_article_id(current_user.id,params[:id])
    @user_articles.update_attributes({:heart => !@user_articles.heart})
    respond_to do |format|
      format.json { head :ok }
    end
  end
  
  def mark_read
    @user_articles = UserArticle.find_or_initialize_by_user_id_and_article_id(current_user.id,params[:id])
    @user_articles.update_attributes({:read => 1})
    respond_to do |format|
      format.json { head :ok }
    end
  end
  
end
