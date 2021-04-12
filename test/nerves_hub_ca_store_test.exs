defmodule NervesHubCaStoreTest do
  use ExUnit.Case
  doctest NervesHubCaStore

  test "Checks that certs are bundled" do
    certs = NervesHubCaStore.ca_certs()
    assert is_list(certs)
    assert Enum.count(certs) == 3
  end
end
