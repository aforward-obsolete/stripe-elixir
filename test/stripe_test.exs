Code.require_file "test_helper.exs", __DIR__

defmodule StripeTest do
  use ExUnit.Case

  test "api_key" do
    stripe = Stripe.new api_key: "abc"
    assert stripe.api_key == "abc"
  end

  test "version" do
    assert Stripe.new.version == "v2"
    assert Stripe.new( version: "v1").version == "v1"
  end

  test "domain" do
    assert Stripe.new.domain == "api.stripe.com"
    assert Stripe.new( domain: "apitest.stripe.com").domain == "apitest.stripe.com"
  end

  test "protocol" do
    assert Stripe.new.protocol == "https"
    assert Stripe.new( protocol: "http").protocol == "http"
  end

  test "url" do
    assert Stripe.new.url("charges") == "https:://api.stripe.com/v2/charges"
    assert Stripe.new( protocol: "http", domain: "apitest.stripe.com", version: "v1").url("refund") == "http:://apitest.stripe.com/v1/refund"
  end

end
