module WordModule
    class ListService
      def initialize(params, action)
        @action = action
        @query = params["query"]
      end
  
      def call
        if @action == "search"
          words = Word.search(@query)
        else
          words = Word.all
        end 
  
        response = "*Words* \n\n"
        words.each do |f|
          response +="*#{f.id}* - "
          response +="#{f.description}\n"
          response +="`#{f.language}`\n"
          response +="\n\n"
        end
        (words.count > 0)? response : "Not Found!"      
      end
    end
  end