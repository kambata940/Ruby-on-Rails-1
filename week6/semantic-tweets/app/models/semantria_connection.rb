class SemantriaConnection

  def initialize
    @session = 
      Semantria::Session.new('be0608af-bf44-44c0-a3ec-fbc7c6ee4f7b',
                             'd351afc8-788a-443d-b15f-60dd69bd7f8f',
                             'TweetFilter',
                             true)
  end

  def filter(texts)
    add(texts)
    results = push_texts
    results.select do |hash|
      hash['sentiment_polarity'] == 'positive'
    end.map { |hash| hash['source_text'] }
  end

  def is_positive?(text)
    add([text])
    result = push_texts
    result[0]['sentiment_polarity'] == 'positive'
  end

private

  def push_texts
    results = []
    while results.length < @length
      status = @session.getProcessedDocuments()
      status.each do |object|
        results.push(object)
      end
    end
    sleep(3)
    results
  end

  def add(texts)
    @length = texts.length
    texts.each_with_index.map do |text, id|
      doc = {'id' => id, 'text' => text.to_s}
      status = @session.queueDocument(doc)
      unless status == 202
        raise RuntimeError, "problem with Semantria"
      end
    end
  end

end