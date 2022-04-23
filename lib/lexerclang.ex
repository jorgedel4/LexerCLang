defmodule Lexerclang do
  def main(path \\ 'codesrc/ex1.c') do
    # path en donde se creara el nuevo archivo
    newFilePath = 'index.html'
    # transforma el codigo a string y luego a charlist
    source = to_charlist(UtilityF.fileContent(path))
    # usa al lexer para tokenizar el codigo fuente
    # CORREGIR LEXER
    {:ok, tokens, _nLines} = :lexer.string(source)

    File.write(
      newFilePath,
      UtilityF.upperHTML(newFilePath)
    )

    Enum.each(
      tokens,
      fn token ->
        {tokenID, _nLine, content} = token
        if(tokenID == :newLine) do
          UtilityF.writeToFile(
            newFilePath,
            "</li>\n<li>",
            false)
        else
          if(tokenID == :comment) do
            UtilityF.writeToFile(
              newFilePath,
              "#{UtilityF.tokenToHTML(token)} </li>\n<li>",
              false
            )
          else
            if(tokenID == :commentm) do
              comments = String.split(
                to_string(content),
                "\n"
              )
              Enum.each(
                comments,
                fn comment ->
                  UtilityF.writeToFile(newFilePath,
                  "<span class='comment'>#{UtilityF.sanitize(comment)}</span> </li>\n<li>",
                  false)
                end)
            else
              UtilityF.writeToFile(
                newFilePath,
                UtilityF.tokenToHTML(token),
                false)
            end
          end
        end
      end
    )

    UtilityF.writeToFile(
      newFilePath,
      UtilityF.lowerHTML)
  end
end
