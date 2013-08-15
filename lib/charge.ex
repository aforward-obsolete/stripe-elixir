defrecord Stripe.Charge, stripe: Stripe.new do

  def charges_cmd({ :amount, amount, :currency, currency, :card, card, :description, desc}, record) do
    charges_cmd [ { :amount, amount }, { :currency, currency}, { :card, card }, { :description, desc } ], record
  end

  def charges_cmd({ :amount, amount, :currency, currency, :customer, customer, :description, desc}, record) do
    charges_cmd [ { :amount, amount }, { :currency, currency}, { :customer, customer }, { :description, desc } ], record
  end

  def charges_cmd(params,record) when is_list(params) do
    [ { :api_key, record.stripe.api_key } ] ++ params ++ [ { :method, :post } ]
    |> record.stripe.curl_cmd charges_url(record)
  end

  def charges_url(record), do: record.stripe.url("charges")
  def refund_url(record), do: record.stripe.url("refund")
  def capture_url(record), do: record.stripe.url("capture")
  def dispute_url(record), do: record.stripe.url("dispute")

end
