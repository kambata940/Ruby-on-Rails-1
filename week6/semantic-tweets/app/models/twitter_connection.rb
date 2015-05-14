  module TwitterConnection
  mattr_accessor :api_key, :api_secret, :oauth_token, :oauth_token_secret

  extend self

  def response_body
    response = prepare_access_token.get('https://api.twitter.com/1.1/statuses/user_timeline.json')
    JSON.parse(response.body)
  end

  def post_tweet(text)
    response = 
      prepare_access_token.post(
        'https://api.twitter.com/1.1/statuses/update.json',
        {status: text})
  end

  private

  def prepare_access_token
    consumer = OAuth::Consumer.new(api_key,
                                   api_secret,
                                   { :site => 'https://api.twitter.com',
                                     :scheme => :header })
    token_hash = { :oauth_token => oauth_token,
                   :oauth_token_secret => oauth_token_secret }

    OAuth::AccessToken.from_hash(consumer, token_hash)
  end
end

load Rails.root.join('config', 'initializers', 'tweeter_config.rb')