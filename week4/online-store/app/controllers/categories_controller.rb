class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    render json: @categories
  end

  def count
    render json: Category.all.size
  end

  def show
    category = Category.find(params[:id])
    render json: category
  end

  def new
  end

  def create
    category = Category.create(name: params[:name])
    render json: category
  end

  def update
    category = Category.find(params[:id])
    category.update(name: params[:name])
    render json: category
  end

  def destroy
    Category.find(params[:id]).destroy
  end

  def range
    range = Category.range(params[:id], params[:count])
    render json: range
  end
end