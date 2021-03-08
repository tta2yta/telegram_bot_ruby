class ItemContainer
  attr_reader :insp_quote
  attr_reader :jokes

  def initialize
    @insp_quote = ['All our dreams can come true, if we have the courage to pursue them.',
                   'The secret of getting ahead is getting started.',
                   'It’s hard to beat a person who never gives up.']

    @jokes = ['Where do you find a cow with no legs? Right where you left it',
              "Why aren't koalas actual bears? They don't meet the koalafications.",
              "What's E.T. short for? Because he's only got little legs."]
  end

  def gen_qoutes
    uri = URI('https://zenquotes.io/api/random')
    res=JSON.parse(Net::HTTP.get(uri))
    res
  end
end
