# NervesHubCaStore

This package contains the Certificate Authority certs for the official
public NervesHub instance. It should be used by any package that requires
these certs including:

* [`nerves_hub_link`](https://github.com/nerves-hub/nerves_hub_link)
* [`nerves_hub_user_api`](https://github.com/nerves-hub/nerves_hub_user_api)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `nerves_hub_ca_store` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:nerves_hub_ca_store, "~> 0.1.0"}
  ]
end
```

## Usage

`nerves_hub_link` and `nerves_hub_user_api` use this package by default. You shouldn't
need to configure anything for them. However if you are looking to supply your own
certs, it should be configured in config.exs:

```elixir
config :nerves_hub_link, ca_store: MyCustomCertStore
config :nerves_hub_user_api, ca_store: MyCustomCertStore
```
