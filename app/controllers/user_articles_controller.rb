class UserArticlesController < ApplicationController
  # GET /user_articles
  # GET /user_articles.json
  def index
    @user_articles = UserArticle.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_articles }
    end
  end

  # GET /user_articles/1
  # GET /user_articles/1.json
  def show
    @user_article = UserArticle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_article }
    end
  end

  # GET /user_articles/new
  # GET /user_articles/new.json
  def new
    @user_article = UserArticle.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_article }
    end
  end

  # GET /user_articles/1/edit
  def edit
    @user_article = UserArticle.find(params[:id])
  end

  # POST /user_articles
  # POST /user_articles.json
  def create
    @user_article = UserArticle.new(params[:user_article])

    respond_to do |format|
      if @user_article.save
        format.html { redirect_to @user_article, notice: 'User article was successfully created.' }
        format.json { render json: @user_article, status: :created, location: @user_article }
      else
        format.html { render action: "new" }
        format.json { render json: @user_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_articles/1
  # PUT /user_articles/1.json
  def update
    @user_article = UserArticle.find(params[:id])

    respond_to do |format|
      if @user_article.update_attributes(params[:user_article])
        format.html { redirect_to @user_article, notice: 'User article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_articles/1
  # DELETE /user_articles/1.json
  def destroy
    @user_article = UserArticle.find(params[:id])
    @user_article.destroy

    respond_to do |format|
      format.html { redirect_to user_articles_url }
      format.json { head :no_content }
    end
  end
end
