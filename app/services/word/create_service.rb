module WordModule

    class CreateService
      def initialize(params)
        @description = params["description"]
        @language = params["language"]
      end
  
      def call
        return 'Description required!' if @description == nil
        Word.transaction do
          word = Word.create(description: @description, language: @language)
        end
        "created successfully!"
      end
    end
  end