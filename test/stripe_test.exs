Code.require_file "test_helper.exs", __DIR__

defmodule StripeTest do
  use ExUnit.Case

  test "private_key" do
    stripe = Stripe.new private_key: "abc"
    assert stripe.private_key == "abc"
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
    assert Stripe.new.url("charges") == "https://api.stripe.com/v2/charges"
    assert Stripe.new( protocol: "http", domain: "apitest.stripe.com", version: "v1").url("refund") == "http://apitest.stripe.com/v1/refund"
  end

  test "curl_param" do
    assert Stripe.new.curl_param({:private_key,"abc_123"}) == { :u, "abc_123" }
    assert Stripe.new.curl_param({:amount,"10 00"}) == { :d, :amount, "10 00" }
    assert Stripe.new.curl_param({:method,:get}) == { :x, :get }
    assert Stripe.new.curl_param({:method,:post}) == { :x, :post }
    assert Stripe.new.curl_param({:method,:put}) == { :x, :put }
    assert Stripe.new.curl_param({:method,:delete}) == { :x, :delete }
  end

  test "curl_params" do
    assert Stripe.new.curl_params([{:private_key,"abc_123"},{:amount,"10 00"}]) == [{ :u, "abc_123" },{ :d, :amount, "10 00" }]
  end

  test "cmd" do
    assert Stripe.new.cmd([{:private_key,"abc_123"},{:amount,"10 00"}], "http://example.com") == "curl http://example.com -u abc_123: -d \"amount=10 00\""
  end

end
