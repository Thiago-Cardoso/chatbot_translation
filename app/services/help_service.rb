class HelpService
    def self.call
      response  = "*Comandos* \n\n"
      response += "help\n"
      response += "`Mostra a lista de palavras`\n\n"
      response += "Traduza a palavra de x de inglês para português\n"
      response += "`Como é a palavra x em inglês`\n\n"
      response
    end
  end