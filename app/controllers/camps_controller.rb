class CampsController < ApplicationController
  # GET /camps
  # GET /camps.json
  def index
    @camps = Camp.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @camps }
    end
  end

  # GET /camps/1
  # GET /camps/1.json
  def show
    @camp = Camp.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @camp }
    end
  end

  # GET /camps/new
  # GET /camps/new.json
  def new
    @camp = Camp.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @camp }
    end
  end

  # GET /camps/1/edit
  def edit
    @camp = Camp.find(params[:id])
  end

  # POST /camps
  # POST /camps.json
  def create
    @camp = Camp.new(params[:camp])

    respond_to do |format|
      if @camp.save
        format.html { redirect_to @camp, notice: 'Camp was successfully created.' }
        format.json { render json: @camp, status: :created, location: @camp }
      else
        format.html { render action: "new" }
        format.json { render json: @camp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /camps/1
  # PUT /camps/1.json
  def update
    @camp = Camp.find(params[:id])

    respond_to do |format|
      if @camp.update_attributes(params[:camp])
        format.html { redirect_to @camp, notice: 'Camp was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @camp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /camps/1
  # DELETE /camps/1.json
  def destroy
    @camp = Camp.find(params[:id])
    @camp.destroy

    respond_to do |format|
      format.html { redirect_to camps_url }
      format.json { head :ok }
    end
  end
end
