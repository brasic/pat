class ConcernsController < ApplicationController
  # GET /concerns
  # GET /concerns.json
  def index
    @concerns = Concern.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @concerns }
    end
  end

  # GET /concerns/1
  # GET /concerns/1.json
  def show
    @concern = Concern.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @concern }
    end
  end

  # GET /concerns/new
  # GET /concerns/new.json
  def new
    @concern = Concern.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @concern }
    end
  end

  # GET /concerns/1/edit
  def edit
    @concern = Concern.find(params[:id])
  end

  # POST /concerns
  # POST /concerns.json
  def create
    @concern = Concern.new(params[:concern])

    respond_to do |format|
      if @concern.save
        format.html { redirect_to @concern, notice: 'Concern was successfully created.' }
        format.json { render json: @concern, status: :created, location: @concern }
      else
        format.html { render action: "new" }
        format.json { render json: @concern.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /concerns/1
  # PUT /concerns/1.json
  def update
    @concern = Concern.find(params[:id])

    respond_to do |format|
      if @concern.update_attributes(params[:concern])
        format.html { redirect_to @concern, notice: 'Concern was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @concern.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /concerns/1
  # DELETE /concerns/1.json
  def destroy
    @concern = Concern.find(params[:id])
    @concern.destroy

    respond_to do |format|
      format.html { redirect_to concerns_url }
      format.json { head :no_content }
    end
  end
end
