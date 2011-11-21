class CampsController < ApplicationController

  def index
    if params[:camp]
      camp = Camp.near(params[:camp][:location], 100).first
      camp ||= Camp.find_by_city(params[:camp][:location].capitalize)
      if camp
        redirect_to camp_url(camp)
      else
        flash[:error] = "No camp found! Try another location!"
        redirect_to root_path
      end
    end
  end

  def show
    @camp = Camp.find(params[:id])
  end

  def new
    @camp = Camp.new
  end

  def edit
    @camp = Camp.find(params[:id])
  end

  def create
    @camp = Camp.new(params[:camp])

    if @camp.save
      redirect_to @camp, notice: 'Camp was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @camp = Camp.find(params[:id])

    if @camp.update_attributes(params[:camp])
      redirect_to @camp, notice: 'Camp was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @camp = Camp.find(params[:id])
    @camp.destroy

    redirect_to camps_url
  end
end
