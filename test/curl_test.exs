Code.require_file "test_helper.exs", __DIR__

defmodule CurlTest do
  use ExUnit.Case

  test "cmd just a url" do
    assert Stripe.Curl.cmd( "http://x.com/blah" ) == "curl http://x.com/blah"
    assert Stripe.Curl.cmd( [], "http://x.com/blah" ) == "curl http://x.com/blah"
  end 

  test "cmd full example" do
    assert Stripe.Curl.cmd( [ { :u, "abc123" }, { :d, :amount, "1000"}, {:d, :card, "tok_1234"}, {:d, :description, "I love stuff" } ], "http://x.com/blah" ) == "curl http://x.com/blah -u abc123: -d amount=1000 -d card=tok_1234 -d \"description=I love stuff\""
  end

  test "param_to_cmd" do
    assert Stripe.Curl.param_to_cmd({:d, :amount, "1000"}) == "-d amount=1000"
    assert Stripe.Curl.param_to_cmd({:d, :amount, "10 00"}) == "-d \"amount=10 00\""
    assert Stripe.Curl.param_to_cmd({:u, "abc123"}) == "-u abc123:"
    assert Stripe.Curl.param_to_cmd({:d, "a mount", "1000"}) == "-d \"a mount=1000\""
    assert Stripe.Curl.param_to_cmd({:x, :get}) == "-X GET"
    assert Stripe.Curl.param_to_cmd({:x, :post}) == "-X POST"
    assert Stripe.Curl.param_to_cmd({:x, :put}) == "-X PUT"
    assert Stripe.Curl.param_to_cmd({:x, :delete}) == "-X DELETE"

  end

end
