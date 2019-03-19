require 'spec_helper'
require './app/services/word/translate_service_yandex'


describe "translation word" do
    before do 
      @word_en = "Word" 
      @word_pt = "Palavra" 
    end
  
    it "translation pt-br to en" do
      response = TranslateServiceYandex.new("pt","en",@word_pt).translate
      puts "return pt-en => "+response
      expect(response.is_a? String).to eql(true)
    end
  
    it "translation en to pt-br" do
      response = TranslateServiceYandex.new("en","pt",@word_en).translate
      puts "return en-pt => "+response
      expect(response.is_a? String).to eql(true)
    end
  end