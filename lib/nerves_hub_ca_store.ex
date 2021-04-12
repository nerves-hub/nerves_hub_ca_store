defmodule NervesHubCaStore do
  @moduledoc """
  Certificate Authority Store for the production NervesHub instance
  """

  @doc "Returns DER encoded certs"
  @spec ca_certs() :: [binary()]
  def ca_certs do
    ca_cert_path = Application.app_dir(:nerves_hub_ca_store, ["priv", "ssl", "prod"])

    ca_cert_path
    |> File.ls!()
    |> Enum.map(&File.read!(Path.join(ca_cert_path, &1)))
    |> Enum.map(&X509.Certificate.to_der(X509.Certificate.from_pem!(&1)))
  end
end
