class InterpretService 

    def self.call action, params
      case action
      when "list", "search"
        WordModule::ListService.new(params, action).call()
      when "create"
        WordModule::CreateService.new(params).call()
      when "remove"
        WordModule::RemoveService.new(params).call()
      when "help"
        HelpService.call()
      else
        "Invalid Option!"    
      end
    end
  end