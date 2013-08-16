defrecord Stripe.Charge, stripe: Stripe.new do

  def charges(input,record), do: System.cmd(charges_cmd(input,record))

  def charges_cmd({ :amount, amount, :currency, currency, :card, card, :description, desc}, record) do
    charges_cmd [ { :amount, amount }, { :currency, currency}, { :card, card }, { :description, desc } ], record
  end

  def charges_cmd({ :amount, amount, :currency, currency, :customer, customer, :description, desc}, record) do
    charges_cmd [ { :amount, amount }, { :currency, currency}, { :customer, customer }, { :description, desc } ], record
  end

  def charges_cmd(params,record) when is_list(params) do
    [ { :private_key, record.stripe.private_key } ] ++ params ++ [ { :method, :post } ]
    |> record.stripe.cmd charges_url(record)
  end

  def charges_url(record), do: record.stripe.url("charges")
  def refund_url(record), do: record.stripe.url("refund")
  def capture_url(record), do: record.stripe.url("capture")
  def dispute_url(record), do: record.stripe.url("dispute")

end
