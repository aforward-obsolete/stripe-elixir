Code.require_file "test_helper.exs", __DIR__

defmodule ChargeTest do
  use ExUnit.Case

  setup do
    stripe = Stripe.new( private_key: "abc123" )
    charge = Stripe.Charge.new( stripe: stripe )
    { :ok, stripe: stripe, charge: charge }
  end

  test "charges_cmd (card)", meta do
    assert meta[:charge].charges_cmd({ :amount, "1000", :currency, "cad", :card, "tok_123", :description, "Charging for services" }) == 
      "curl https://api.stripe.com/v2/charges -u abc123: -d amount=1000 -d currency=cad -d card=tok_123 -d \"description=Charging for services\" -X POST"
  end

  test "charges_cmd (customer)", meta do
    assert meta[:charge].charges_cmd({ :amount, "1000", :currency, "cad", :customer, "cid", :description, "Charging for services" }) == 
      "curl https://api.stripe.com/v2/charges -u abc123: -d amount=1000 -d currency=cad -d customer=cid -d \"description=Charging for services\" -X POST"
  end

  test "charges_cmd (generic)", meta do
    assert meta[:charge].charges_cmd([ {:amount, "1000"}, {:blah, "def"} ]) ==
      "curl https://api.stripe.com/v2/charges -u abc123: -d amount=1000 -d blah=def -X POST"
  end

  test "charges should curl the command" do
    cc_info = "tok_2Og"
    stripe = Stripe.new( private_key: "sk_test", version: "v1")
    charge = Stripe.Charge.new(stripe: stripe)
    answer = charge.charges({ :amount, "2000", :currency, "cad", :card, cc_info, :description, "Charging for services" })
    assert answer == {:ok, [{"error", [{"type", "invalid_request_error"}, {"message", "Invalid API Key provided: sk_****"}]}]}
  end

  test "charges_url" do
    assert Stripe.Charge.new.charges_url == "https://api.stripe.com/v2/charges"
    assert Stripe.Charge.new(stripe: Stripe.new( version: "v1")).charges_url == "https://api.stripe.com/v1/charges"
  end

  test "refund_url" do
    assert Stripe.Charge.new.refund_url == "https://api.stripe.com/v2/refund"
    assert Stripe.Charge.new(stripe: Stripe.new( version: "v1")).refund_url == "https://api.stripe.com/v1/refund"
  end

  test "capture_url" do
    assert Stripe.Charge.new.capture_url == "https://api.stripe.com/v2/capture"
    assert Stripe.Charge.new(stripe: Stripe.new( version: "v1")).capture_url == "https://api.stripe.com/v1/capture"
  end

  test "dispute_url" do
    assert Stripe.Charge.new.dispute_url == "https://api.stripe.com/v2/dispute"
    assert Stripe.Charge.new(stripe: Stripe.new( version: "v1")).dispute_url == "https://api.stripe.com/v1/dispute"
  end

end
