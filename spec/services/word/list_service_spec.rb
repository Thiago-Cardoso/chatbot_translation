require_relative './../../spec_helper.rb'

describe WordModule::ListService do
  describe '#call' do
    context "list command" do
      context "Zero word in database" do 
        it "Return don't find word" do 
         #list not necessity parameters
          @listService = WordModule::ListService.new({}, 'list')
          #call and wait not found
          response  = @listService.call()
          expect(response).to match("Not Found!")
        end
      end

      context "Two words in database" do 
        it "Find words in response" do 
          @listService = WordModule::ListService.new({}, 'list')
          word1 = create(:word)
          word2 = create(:word)

          #list of commands word
          response  = @listService.call()

          expect(response).to match(word1.description)
          expect(response).to match(word2.description)
        end
      end
    end

    context "search command" do
      context "Empty query" do
        it "return don't find word" do
          @listService = WordModule::ListService.new({'query' => ''}, 'search')

          response = @listService.call()
          expect(response).to match("Not Found!")
        end
      end

      context "Valid query" do
        it "find word in response" do
         #create new word
          word = create(:word)

          #list passed with parameters
          @listService = WordModule::ListService.new({'query' => word.description}, 'search')

          #call service
          response = @listService.call()
          expect(response).to match(word.description)
        end
      end
    end
  end
end