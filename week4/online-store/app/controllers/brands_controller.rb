class BrandsController < ApplicationController
  

  def index
    @brands = Brand.all
    render json: @brands
  end

  def show
    brand = Brand.find(params[:id])
    render json: brand
  end

  def count
    size = Brand.all.size
    render json: size
  end

  def new
    @brand = Brand.new
  end


  def create
    brand = Brand.create(name: params[:name], description: params[:description])
    render json: brand
  end

  def update
    brand = Brand.find(params[:id])
    brand.update(name: params[:name], description: params[:description])
    render json: brand
  end

  def destroy
    Brand.find(params[:id]).destroy
  end

  def range
    range = Brand.range(params[:id], params[:count])
    render json: range
  end
end