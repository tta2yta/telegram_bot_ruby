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
    it 'Generatting random Quotes' do
      usr.user_name('Ted')
      expect(itm_con.gen_qoutes.class).to eql(Array)
    end
  end
end
