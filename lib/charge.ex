defmodule Stripe.Charge do

  def charges_url, do: charges_url(StripeApi.new)
  def charges_url(stripe), do: stripe.url("charges")

  def refund_url, do: refund_url(StripeApi.new)
  def refund_url(stripe), do: stripe.url("refund")

  def capture_url, do: capture_url(StripeApi.new)
  def capture_url(stripe), do: stripe.url("capture")

  def dispute_url, do: dispute_url(StripeApi.new)
  def dispute_url(stripe), do: stripe.url("dispute")

end