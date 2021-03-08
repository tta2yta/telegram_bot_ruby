# spec/tic_tac_toe_spce.rb
require './lib/itemcontainer'
require './lib/user'

describe ItemContainer do
  let(:itm_con) { ItemContainer.new }
  let(:usr) { User.new }
  describe '#gen_qoutes' do
    it 'Setting User Name' do
      expect(usr.user_name('Ted')).to eql('Ted')
    end
  end
end
