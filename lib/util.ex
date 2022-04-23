defmodule UtilityF do
  def upperHTML (path) do
    returnHTML = "<!DOCTYPE html>
<html lang='en'>
<head>
  <meta charset='UTF-8'>
  <meta http-equiv='X-UA-Compatible' content='IE=edge'>
  <meta name='viewport' content='width=device-width, initial-scale=1.0'>
  <title>#{path}</title>
  <link rel='stylesheet' href='styles.css'>
</head>
<body>
  <ol>
    <li>"
    returnHTML
  end

  def lowerHTML() do
    returnHTML = "
      </li>
    </ol>
  </body>
</html>"
    returnHTML
  end

  def fileContent(path) do
    {:ok, current} = File.read(path)
    current
  end

  def writeToFile(filePath, content, newline\\true) do
    prevContent = fileContent(filePath)
    if(newline == true) do
      File.write(filePath, "#{prevContent}\n#{content}")
    else
      File.write(filePath, "#{prevContent}#{content}")
    end
  end

  def makeLi(s) do
    liElem = "<li>#{s}</li>"
    liElem
  end

  def sanitize(s) do
    String.replace(s, "<", "&lt;") |>
    String.replace(">", "&gt;") |>
    String.replace(" ", "&nbsp;")
  end

  def tokenToHTML(token) do
    {tokenID, _, tokenValue} = token
    htmlTag = "<span class='#{Atom.to_string(tokenID)}'>#{UtilityF.sanitize(to_string tokenValue)}</span>"
    htmlTag
  end
end
