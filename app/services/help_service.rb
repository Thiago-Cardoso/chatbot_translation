class HelpService
    def self.call
      response  = "*Comandos* \n\n"
      response += "help\n"
      response += "`Lista de comandos que eu conheço`\n\n"
      response += "Tradução\n"
      response += "Traduza a palavra de x de inglês para português\n"
      response += "`Como é a palavra x em inglês`\n\n"
      response += "remova ID\n"
      response += "`Remove uma palavra baseada no ID dela`\n\n"
      response += "listagem\n"
      response += "`Mostra a lista de palavras`\n\n"
      response
    end
  end