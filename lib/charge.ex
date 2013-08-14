defrecord Stripe.Charge, stripe: Stripe.new, amount: nil, currency: nil, customer: nil, card: nil do

  def charges_url(record), do: record.stripe.url("charges")
  def refund_url(record), do: record.stripe.url("refund")
  def capture_url(record), do: record.stripe.url("capture")
  def dispute_url(record), do: record.stripe.url("dispute")

end
