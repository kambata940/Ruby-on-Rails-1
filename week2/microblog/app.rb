require 'sinatra/base'
require 'sqlite3'


class ValidationError < StandardError
end

class Post
  #attr_reader :nickname, :data, :time

  def initialize(nickname, data)
    @nickname = nickname
    @data = data
    @time = Time.new.to_s
    @db = SQLite3::Database.new "microblog.db"
  end

  def self.is_valid?(nickname, data)
    if nickname.size < 41 and data.size < 256
      true
    else
      false
    end
  end

  def save
    values = [@nickname, @data, @time]
    @db.execute("INSERT INTO Posts (nickname, data, time) VALUES (?,?,?);", values)
    id = @db.execute("SELECT max(id) FROM Posts;")[0][0]
    save_tags(id)
  end
  
  def save_tags(id)
    tags = @data.scan(/#(\w+)/).map { |arr| arr[0] }
    if tags.size > 0
      tags.each do |tag|
        @db.execute("INSERT INTO Tags (postId, tag) VALUES (?,?);", id, tag)
      end
    end
  end
end

class Posts
  def initialize
    @db = SQLite3::Database.new "microblog.db"
  end

  def all
    @db.query("SELECT nickname FROM Posts ")
  end

  def add_post(nickname, data)
    if Post.is_valid?(nickname, data)
      post = Post.new(nickname, data)
      post.save
    else
      raise ValidationError, "validation failed!"
    end
  end

  def get_post(id)
    @db.query("SELECT * FROM Posts WHERE id=?", [id])
  end

  def delete(id)
    @db.query("DELETE FROM Posts WHERE id=?", [id])
  end

  def search(tag)
    tags = @db.execute("SELECT postId FROM Tags WHERE tag=?", tag)
    tags.map do |arr|
      id = arr[0]
      @db.execute("SELECT nickname FROM Posts WHERE id=?", id)
    end
  end
end

class Application < Sinatra::Base
  @posts = Posts.new
  
  get '/' do
    erb :index, locals: {posts: @posts.all}
  end

  get '/new' do
    erb :create_post
  end

  post '/new' do
    @posts.add_post(params[:nickname], params[:data])
  end

  get '/:id/?' do |id|
    @posts.get_post?(id)
  end

  delete '/:id' do |id|
    @posts.delete(id)
  end

  get '/search/:tag' do |tag|
    @posts.search(tag)
  end

  #run!
end
