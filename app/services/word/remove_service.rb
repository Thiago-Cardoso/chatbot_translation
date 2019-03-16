module WordModule
    class RemoveService
      def initialize(params)
        @params = params
        @id = params["id"]
      end
  
      def call
        word = Word.where(id: @id).last
        return 'Invalid Word, verify ID!' if word == nil
        Word.transaction do
            word.delete
        end
        "deleted successfully!" 
      end
    end
  end