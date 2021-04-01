defmodule Hypermarkdown do
  alias Hypermarkdown.MarkdownToHtml
  @moduledoc """
  Documentation for `Hypermarkdown`.
  """

  def parse(:md_to_html, md_string) do
    md_string
    |> String.split("\n")
    |> MarkdownToHtml.parse()
    |> Enum.join("\n")
  end
end
