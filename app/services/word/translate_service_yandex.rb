require 'rest-client'
require 'json'

class TranslateServiceYandex
  def initialize(lang_o,lang_dest,text)
    @language = "#{lang_o}-#{lang_dest}"
    @text = text    
    @key = "trnsl.1.1.20190315T025311Z.29e00dd7bdd69018.9ba19adc153396edbac1c227d4d36776bbf33f0b" 
  end

  def translate
    begin
      translate_api_url = "https://translate.yandex.net/api/v1.5/tr.json/translate?"
      url_yandex = "#{translate_api_url}key=#{@key}&lang=#{@language}"

      # res = RestClient.post url_yandex, text: @text.to_json, :accept => :json 
      res = RestClient.post(url_yandex, {text: @text})
      value = JSON.parse(res.body)["text"][0]
      
    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end
end