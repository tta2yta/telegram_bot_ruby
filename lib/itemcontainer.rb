class ItemContainer
  attr_reader :insp_quote
  attr_reader :jokes

  def initialize
    @insp_quote=[]
    @jokes = ['Where do you find a cow with no legs? Right where you left it',
              "Why aren't koalas actual bears? They don't meet the koalafications.",
              "What's E.T. short for? Because he's only got little legs."]
  end

  def gen_qoutes
    uri = URI('https://zenquotes.io/api/random')
    @insp_quote=JSON.parse(Net::HTTP.get(uri))
    if @insp_quote.empty?
        @insp_quote=[ {"q":"The power of man has grown in every sphere, except over himself.","a":"Winston Churchill",
        "h":"<blockquote>&ldquo;The power of man has grown in every sphere, except over himself.&rdquo; &mdash; <footer>Winston Churchill</footer></blockquote>"} ]
  end
end
