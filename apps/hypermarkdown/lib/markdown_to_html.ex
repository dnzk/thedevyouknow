defmodule Hypermarkdown.MarkdownToHtml do
  def parse(list) do
    for line <- list, do: convert(line)
  end

  defp convert(line) do
    case line do
      "#" <> _ -> parse_header(line)
      _ -> parse_paragraph(line)
    end
  end

  defp parse_header(str) do
    case str do
      "# " <> title -> "<h1>#{title}</h1>"
      "## " <> title -> "<h2>#{title}</h2>"
      "### " <> title -> "<h3>#{title}</h3>"
      "#### " <> title -> "<h4>#{title}</h4>"
      "##### " <> title -> "<h5>#{title}</h5>"
      "###### " <> title -> "<h6>#{title}</h6>"
      _ -> str
    end
  end

  defp parse_paragraph(""), do: ""

  defp parse_paragraph(string), do: "<p>#{string}</p>"
end
