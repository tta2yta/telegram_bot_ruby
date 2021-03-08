require_relative('../lib/user')
class ItemContainer < User
  attr_reader :insp_quote
  attr_reader :jokes
  def initialize
    @insp_quote = []
    @jokes = []
  end

  def gen_qoutes
    if !@insp_quote.empty?
      uri = URI('https://zenquotes.io/api/random')
      @insp_quote = JSON.parse(Net::HTTP.get(uri))
    else
      @insp_quote = [{ "q": 'The power of man has grown in every sphere,
       except over himself.', "a": 'Winston Churchill' }]
    end
  end

  def gen_jokes
    if !@jokes.empty?
      uri = URI("https://api.chucknorris.io/jokes/random?name=#{@name}")
      @jokes = JSON.parse(Net::HTTP.get(uri))
    else
      @jokes = [{ "value": "#{@name} once repurposed an old baby chair into a four legged Ninja flying death spear." }]
    end
  end
end
