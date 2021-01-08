defmodule LatexExample.MixProject do
  use Mix.Project

  def project do
    [
      app: :latex_example,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.23", only: :dev, runtime: false}
    ]
  end

  defp docs do
    [
      main: "LatexExample",
      # You can specify a function for adding
      # custom content to the generated HTML.
      # This is useful for custom JS/CSS files you want to include.
      before_closing_body_tag: &before_closing_body_tag/1
      # ...
    ]
  end

  # In our case we simply add a <script> tag
  # that loads MathJax from CDN and specify the configuration.
  # Once loaded, the script will dynamically turn any LaTeX
  # expressions on the page into SVG images.
  defp before_closing_body_tag(:html) do
    """
    <script>
      window.MathJax = {
        tex: {
          inlineMath: [['$', '$']],
          displayMath: [['$$','$$']],
        },
      };
    </script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-svg.js"></script>
    """
  end

  defp before_closing_body_tag(_), do: ""
end
