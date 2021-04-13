defmodule NervesHubCaStoreTest do
  use ExUnit.Case
  doctest NervesHubCaStore

  test "production certificate store" do
    check_path(:prod)
    check_certificates(:prod)
    check_bundled(:prod)
  end

  test "staging certificate store" do
    check_path(:staging)
    check_certificates(:staging)
    check_bundled(:staging)
  end

  test "alias ca_certs" do
    der_certs = NervesHubCaStore.ca_certs()
    assert is_list(der_certs)
  end

  defp check_bundled(env) do
    der_certs = NervesHubCaStore.cacerts(env)
    assert is_list(der_certs)
    assert length(der_certs) == 3
    assert Enum.all?(der_certs, &is_binary/1)
  end

  defp check_path(env) do
    assert File.exists?(NervesHubCaStore.file_path(env))
  end

  defp check_certificates(env) do
    otp_certs = NervesHubCaStore.certificates(env)
    assert is_list(otp_certs)
    assert length(otp_certs) == 3
    assert Enum.all?(otp_certs, &is_tuple/1)
  end
end
