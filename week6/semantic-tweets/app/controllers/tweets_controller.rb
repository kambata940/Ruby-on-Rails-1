class TweetsController < ApplicationController
  def index
    @tweets = TwitterConnection.response_body.map { |e| Tweet.new(text: e["text"]) }
    @positive_tweets = SemantriaConnection.new.filter(@tweets)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(text: params[:text])
    if SemantriaConnection.new.is_positive?(@tweet)
      TwitterConnection.post_tweet(@tweet)
      redirect_to '/'
    else
      redirect_to :new
    end
  end

end