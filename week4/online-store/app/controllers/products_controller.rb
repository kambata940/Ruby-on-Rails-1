class ProductsController < ApplicationController

  def index
    render json: Product.all
  end

  def count
    render json: Product.all.size
  end

  def show
    product = Product.find(params[:id])
    render json: product
  end

  def new
    
  end

  def create
    brand = Brand.find_by(name: params[:brand_name])
    category = Category.find_by(name: params[:category_name])
    product = Product.create(name: params[:name],
                             brand: brand,
                             category: category,
                             price: params[:price],
                             quantity: params[:quantity])
    render json: product
  end

  def update
    product = Product.find(params[:id])
    product.update(name: params[:name],   
                   brand: brand,
                   category: category,
                   price: params[:price],
                   quantity: params[:quantity])
    render json: product
  end

  def range
    range = Product.range(params[:id], params[:count])
    render json: range
  end
end