class Tweet
  attr_accessor :text
  def initialize(text: '')
    @text = text
  end

  def to_s
    @text
  end
end
