defmodule HypermarkdownTest do
  use ExUnit.Case
  doctest Hypermarkdown

  test "parse header" do
    x = "## Header 2"
    assert Hypermarkdown.parse(:md_to_html, x) == "<h2>Header 2</h2>"
  end

  test "parse paragraph" do
    x = "test"
    assert Hypermarkdown.parse(:md_to_html, x) == "<p>test</p>"
  end

  test "multiple lines" do
    x = """
    # Title
    paragraph goes here
    """
    assert Hypermarkdown.parse(:md_to_html, x) == "<h1>Title</h1>\n<p>paragraph goes here</p>"
  end
end
