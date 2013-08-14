Code.require_file "test_helper.exs", __DIR__

defmodule ChargeTest do
  use ExUnit.Case

  test "charges_url" do
    assert Stripe.Charge.new.charges_url == "https:://api.stripe.com/v2/charges"
    assert Stripe.Charge.new(stripe: Stripe.new( version: "v1")).charges_url == "https:://api.stripe.com/v1/charges"
  end

  test "refund_url" do
    assert Stripe.Charge.new.refund_url == "https:://api.stripe.com/v2/refund"
    assert Stripe.Charge.new(stripe: Stripe.new( version: "v1")).refund_url == "https:://api.stripe.com/v1/refund"
  end

  test "capture_url" do
    assert Stripe.Charge.new.capture_url == "https:://api.stripe.com/v2/capture"
    assert Stripe.Charge.new(stripe: Stripe.new( version: "v1")).capture_url == "https:://api.stripe.com/v1/capture"
  end

  test "dispute_url" do
    assert Stripe.Charge.new.dispute_url == "https:://api.stripe.com/v2/dispute"
    assert Stripe.Charge.new(stripe: Stripe.new( version: "v1")).dispute_url == "https:://api.stripe.com/v1/dispute"
  end

end
