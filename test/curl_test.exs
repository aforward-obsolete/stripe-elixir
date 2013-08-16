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

  test "exec should return json" do
    answer = Stripe.Curl.exec("curl https://api.stripe.com/v1/charges -u invalid: -d amount=2000 -d currency=cad -d card=tok_2Og -X POST")
    assert answer == {:ok,
                       [{"error",
                         [{"type", "invalid_request_error"},
                          {"message", "Invalid API Key provided: *******"}]}]}
  end

  test "parameterize" do
    assert Stripe.Curl.parameterize({:d, :amount, "1000"}) == "-d amount=1000"
    assert Stripe.Curl.parameterize({:d, :amount, "10 00"}) == "-d \"amount=10 00\""
    assert Stripe.Curl.parameterize({:u, "abc123"}) == "-u abc123:"
    assert Stripe.Curl.parameterize({:d, "a mount", "1000"}) == "-d \"a mount=1000\""
    assert Stripe.Curl.parameterize({:x, :get}) == "-X GET"
    assert Stripe.Curl.parameterize({:x, :post}) == "-X POST"
    assert Stripe.Curl.parameterize({:x, :put}) == "-X PUT"
    assert Stripe.Curl.parameterize({:x, :delete}) == "-X DELETE"

  end

end
