# spec/tic_tac_toe_spce.rb
require './lib/itemcontainer'
require './lib/user'

describe ItemContainer do
  let(:itm_con) { ItemContainer.new }
  let(:usr) { User.new }
  describe '#user_name' do
    it 'Setting User Name' do
      expect(usr.user_name('Ted')).to eql('Ted')
    end
  end
  describe '#gen_qoutes' do
    it 'Generatting random Quotes and should return Array' do
      expect(itm_con.gen_qoutes.class).to eql(Array)
    end
    it 'Generatting random Quotes and should return Array' do
        expect(itm_con.gen_qoutes.class).not_to eql(Hash)
    end
  end

  describe '#gen_jokes' do
    it 'Generatting random jokes and should return Hash' do
      usr.user_name('Ted')
      expect(itm_con.gen_jokes.class).to eql(Hash)
    end
  end

  describe '#eru_exchange' do
    it 'Generatting Exchange Rates for EUR to other Currencies and should return hash' do
      expect(itm_con.eru_exchange.class).to eql(Hash)
    end
    it 'Generatting Exchange Rates for EUR to other Currencies and should return hash' do
        expect(itm_con.eru_exchange.class).not_to eql(Array)
      end
  end
end
