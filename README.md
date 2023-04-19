# NervesHubCAStore

[![Hex version](https://img.shields.io/hexpm/v/nerves_hub_ca_store.svg "Hex version")](https://hex.pm/packages/nerves_hub_ca_store)
[![CircleCI](https://circleci.com/gh/nerves-hub/nerves_hub_ca_store.svg?style=svg)](https://circleci.com/gh/nerves-hub/nerves_hub_ca_store)

**Important**

With the public NervesHub instance offline, this package is no longer needed and is archived.

---

This package contains the Certificate Authority certs for the official
public NervesHub instance. It should be used by any package that requires
these certs including:

* [`nerves_hub_link`](https://github.com/nerves-hub/nerves_hub_link)
* [`nerves_hub_link_http`](https://github.com/nerves-hub/nerves_hub_link_http)
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

This provides 3 convenience functions to aid with SSL connections to public NervesHub
instances:

| | |
| --- | --- |
| `NervesHubCAStore.file_path/0` | path to generated `cacerts.pem` |
| `NervesHubCAStore.certificates/0` | Reads the `cacerts.pem` in as a list of OTP certificates |
| `NervesHubCAStore.cacerts/0` | Reads the `cacerts.pem` in as a list of DER encoded certificates |

**Note**: Each function can also be supplied with the `:prod` or `:staging` env
to dictate which set of certificates to read in and defaults to `:prod`. It is
rare that anyone other than the maintainers will need to use the `:staging`
certificates
