require_relative './../../spec_helper.rb'
  
describe WordModule::RemoveService do
 
  describe '#call' do
    context "Valid ID" do
      before do
        #create a word passed um object with id
        word = create(:word)
        @removeService = WordModule::RemoveService.new({"id" => word.id})
      end
 
      it "Return success word" do
         #call service
        response = @removeService.call()
        expect(response).to match("deleted successfully!")
      end
 
      it "Remove Word from database" do
        expect(Word.all.count).to eq(1)
        response = @removeService.call()
        expect(Word.all.count).to eq(0)
      end
    end
 
    context "Invalid ID" do
      it "return error word" do
          #if remove word with invalid id - generate a sorted id
        @removeService = WordModule::RemoveService.new({"id" => rand(1..9999)})
        response = @removeService.call()

         #return invalid word
        expect(response).to match("Invalid word, verify ID!")
      end
    end
  end
end