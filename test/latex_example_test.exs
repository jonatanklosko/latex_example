defmodule LatexExampleTest do
  use ExUnit.Case
  doctest LatexExample

  test "greets the world" do
    assert LatexExample.hello() == :world
  end
end
