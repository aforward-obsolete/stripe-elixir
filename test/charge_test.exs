Code.require_file "test_helper.exs", __DIR__

defmodule ChargeTest do
  use ExUnit.Case

  test "charges_url" do
    assert Stripe.Charge.charges_url == "https:://api.stripe.com/v2/charges"
    assert Stripe.Charge.charges_url(StripeApi.new( version: "v1")) == "https:://api.stripe.com/v1/charges"
  end

  test "refund_url" do
    assert Stripe.Charge.refund_url == "https:://api.stripe.com/v2/refund"
    assert Stripe.Charge.refund_url(StripeApi.new( version: "v1")) == "https:://api.stripe.com/v1/refund"
  end

  test "capture_url" do
    assert Stripe.Charge.capture_url == "https:://api.stripe.com/v2/capture"
    assert Stripe.Charge.capture_url(StripeApi.new( version: "v1")) == "https:://api.stripe.com/v1/capture"
  end

  test "dispute_url" do
    assert Stripe.Charge.dispute_url == "https:://api.stripe.com/v2/dispute"
    assert Stripe.Charge.dispute_url(StripeApi.new( version: "v1")) == "https:://api.stripe.com/v1/dispute"
  end

end
