class SmartCategoriesController < ApplicationController
  # GET /smart_categories
  # GET /smart_categories.json
  def index
    @smart_categories = SmartCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @smart_categories }
    end
  end

  # GET /smart_categories/1
  # GET /smart_categories/1.json
  def show
    @smart_category = SmartCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @smart_category }
    end
  end

  # GET /smart_categories/new
  # GET /smart_categories/new.json
  def new
    @smart_category = SmartCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @smart_category }
    end
  end

  # GET /smart_categories/1/edit
  def edit
    @smart_category = SmartCategory.find(params[:id])
  end

  # POST /smart_categories
  # POST /smart_categories.json
  def create
    @smart_category = SmartCategory.new(params[:smart_category])

    respond_to do |format|
      if @smart_category.save
        format.html { redirect_to @smart_category, :notice => 'Smart category was successfully created.' }
        format.json { render :json => @smart_category, :status => :created, :location => @smart_category }
      else
        format.html { render :action => "new" }
        format.json { render :json => @smart_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /smart_categories/1
  # PUT /smart_categories/1.json
  def update
    @smart_category = SmartCategory.find(params[:id])

    respond_to do |format|
      if @smart_category.update_attributes(params[:smart_category])
        format.html { redirect_to @smart_category, :notice => 'Smart category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @smart_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /smart_categories/1
  # DELETE /smart_categories/1.json
  def destroy
    @smart_category = SmartCategory.find(params[:id])
    @smart_category.destroy

    respond_to do |format|
      format.html { redirect_to smart_categories_url }
      format.json { head :no_content }
    end
  end
end
