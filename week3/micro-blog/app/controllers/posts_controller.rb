class PostsController < ApplicationController
   before_action :load_post, only: [:show]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    
  end

  def create
    @post = Post.new(title: params[:post][:title],
                     body: params[:post][:body])
    if @post.save
      create_tags
      redirect_to @post
    else
      
    end
  end

  private

  def load_post
    @post = Post.find(params[:id])
  end

  def create_tags
    @post.find_tags.each { |tag| @post.tags.create(content: tag) }
  end
end