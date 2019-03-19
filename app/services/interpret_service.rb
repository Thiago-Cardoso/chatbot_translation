class InterpretService 

    def self.call action, params
      case action
      when "create"
        WordModule::CreateService.new(params).call()
      when "help"
        HelpService.call()
      else
        "Invalid Option!"    
      end
    end
  end