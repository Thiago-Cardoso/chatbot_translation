require_relative './../../spec_helper.rb'

describe WordModule::CreateService do
  before do
    @description = FFaker::Lorem.sentence
    @language = "en"
  end

  #call
  describe "#call" do 
    context "Without description params" do 
      it "Will receive a error" do
        @createService = WordModule::CreateService.new({"language" => @language})
        response = @createService.call()
        expect(response).to match("Description required!")
      end
    end

    # verificate without valid params
    context "Without Valid params" do 
      before do
        @createService = WordModule::CreateService.new({"description" => @description, "language" => @language})
        @response = @createService.call()
      end

      # verificate if description and language is present in database
      it "Description and language is present in database" do
        expect(Word.last.description).to match(@description)
        expect(Word.last.language).to match(@language)
      end
    end
  end
end