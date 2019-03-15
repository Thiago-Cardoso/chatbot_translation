require_relative './../spec_helper.rb'

describe HelpService do
  describe '#call' do
    it "Response have the main commands" do
      response = HelpService.call()
      expect(response).to match('help')
      expect(response).to match('remover ID')
      expect(response).to match('Mostra a lista de palavras')
      expect(response).to match('Traduza a palavra de x de inglês para português')
      expect(response).to match('Como é a palavra x em inglês')
    end
  end
end