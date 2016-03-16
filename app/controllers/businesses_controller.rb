class BusinessesController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @businesses = Business.all.order("created_at DESC")
  end

  def show
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
    @business = Business.find(params[:id])
  end

  def business_params
    params.require(:business).permit(:name, :description, :address, :city, :state, :zip, :image)
  end
end
