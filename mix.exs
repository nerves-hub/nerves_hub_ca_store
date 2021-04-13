defmodule NervesHubCaStore.MixProject do
  use Mix.Project

  @version "0.1.0"
  @source_url "https://github.com/nerves-hub/nerves_hub_ca_store"

  def project do
    [
      app: :nerves_hub_ca_store,
      version: @version,
      description: description(),
      docs: docs(),
      package: package(),
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      preferred_cli_env: [
        docs: :docs,
        "hex.build": :docs,
        "hex.publish": :docs
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp description do
    "The NervesHub CA store"
  end

  defp docs do
    [
      extras: ["README.md", "CHANGELOG.md"],
      main: "readme",
      source_ref: "v#{@version}",
      source_url: @source_url,
      skip_undefined_reference_warnings_on: ["CHANGELOG.md"]
    ]
  end

  defp package do
    [
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => @source_url},
      files: [
        "priv",
        "lib",
        "CHANGELOG.md",
        "LICENSE",
        "mix.exs",
        "README.md"
      ]
    ]
  end

  defp deps do
    [
      {:x509, "~> 0.5"},
      {:dialyxir, "~> 1.1", only: :dev},
      {:ex_doc, "~> 0.24", only: :docs}
    ]
  end
end
