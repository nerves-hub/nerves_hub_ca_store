defmodule NervesHubCaStore do
  @moduledoc """
  Certificate Authority Store for the production NervesHub instance

  #{File.read!("README.md") |> String.split("## Usage") |> Enum.at(1)}
  """

  @type env :: :prod | :staging

  @doc """
  Returns DER encoded list of CA certificates
  """
  @spec cacerts(env) :: [:public_key.der_encoded()]
  def cacerts(env \\ :prod) do
    for cert <- certificates(env), do: X509.Certificate.to_der(cert)
  end

  @doc """
  Alias for NervesHubCaStore.cacerts/1
  """
  @spec ca_certs(env) :: [:public_key.der_encoded()]
  def ca_certs(env \\ :prod), do: cacerts(env)

  @doc """
  CA Store as list of OTP compatible certificate records
  """
  @spec certificates(env) :: [tuple()]
  def certificates(env \\ :prod) do
    file_path(env)
    |> File.read!()
    |> X509.from_pem()
  end

  @doc """
  File path to cacerts.pem
  """
  @spec file_path(env :: :prod | :staging) :: Path.t()
  def file_path(env \\ :prod) do
    Application.app_dir(:nerves_hub_ca_store, ["priv", "ssl", "#{env}", "cacerts.pem"])
  end
end
