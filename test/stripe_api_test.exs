Code.require_file "test_helper.exs", __DIR__

defmodule StripeApiTest do
  use ExUnit.Case

  test "api_key" do
    stripe = StripeApi.new api_key: "abc"
    assert stripe.api_key == "abc"
  end

  test "version" do
    assert StripeApi.new.version == "v2"
    assert StripeApi.new( version: "v1").version == "v1"
  end

  test "domain" do
    assert StripeApi.new.domain == "api.stripe.com"
    assert StripeApi.new( domain: "apitest.stripe.com").domain == "apitest.stripe.com"
  end

  test "protocol" do
    assert StripeApi.new.protocol == "https"
    assert StripeApi.new( protocol: "http").protocol == "http"
  end

  test "url" do
    assert StripeApi.new.url("charges") == "https:://api.stripe.com/v2/charges"
    assert StripeApi.new( protocol: "http", domain: "apitest.stripe.com", version: "v1").url("refund") == "http:://apitest.stripe.com/v1/refund"
  end

end
