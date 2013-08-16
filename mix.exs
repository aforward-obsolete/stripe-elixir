defmodule Stripe.Mixfile do
  use Mix.Project

  def project do
    [ app: :"stripe-elixir",
      version: "0.0.1",
      elixir: "~> 0.10.2-dev",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [
      # applications: [ :hackney, :jsex ],
      # env: [
      #   host: "http://localhost",
      #   port: "8080",
      #   app_key: "app_key",
      #   app_secret: "secret",
      #   app_id: "app_id"
      # ]
    ]
  end

  # Returns the list of dependencies in the format:
  # { :foobar, "~> 0.1", git: "https://github.com/elixir-lang/foobar.git" }
  defp deps do
    [
     # {:hackney, github: "benoitc/hackney"},
     {:jsex, github: "talentdeficit/jsex"},
     # {:uri, github: "erlware/uri"},
     # {:ex_doc, github: "elixir-lang/ex_doc" },
     # {:meck, github: "eproxus/meck", tag: "0.7.2" }
    ]
  end
end
