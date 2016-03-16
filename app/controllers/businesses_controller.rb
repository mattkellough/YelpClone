class BusinessesController < ApplicationController
  def index
  end

  def show
    @business = Business.find(params[:id])
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)

    if @business.save
      redirect_to @business
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_post
  end

  def business_params
    params.require(:business).permit(:name, :description, :address, :city, :state, :zip)
  end
end
