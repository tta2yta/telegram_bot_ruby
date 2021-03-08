require_relative('../lib/user')
class ItemContainer < User
  attr_reader :insp_quote
  attr_reader :jokes
  attr_reader :emoji
  attr_reader :exch
  def initialize
    @insp_quote = []
    @jokes = []
    @emoji = ['🎂', '🎁', '🕯️', '🎊', '🎉']
    @exch = []
  end

  def gen_qoutes
    uri = URI('https://zenquotes.io/api/random')
    @insp_quote = JSON.parse(Net::HTTP.get(uri))
    if @insp_quote.empty?
      @insp_quote = [{ "q": 'The power of man has grown in every sphere,
        except over himself.', "a": 'Winston Churchill' }]
    else
      @insp_quote
    end
    @insp_quote
  end

  def gen_jokes
    uri = URI("https://api.chucknorris.io/jokes/random?name=#{@name}")
    @jokes = JSON.parse(Net::HTTP.get(uri))
    if @jokes.empty?
      @jokes = [{ "value": 'opjhij once repurposed an old baby
    chair into a four legged Ninja flying death spear.' }]
    else
      @jokes
    end
  end

  def eru_exchange
    uri = URI('https://api.exchangerate.host/latest')
    @exch = JSON.parse(Net::HTTP.get(uri))
  end

  def sum
    2 + 2
  end
end
