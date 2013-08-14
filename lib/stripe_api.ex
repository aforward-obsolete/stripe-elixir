defrecord StripeApi, api_key: nil, protocol: "https", domain: "api.stripe.com", version: "v2" do

  def url(operation, record), do: "#{record.protocol}:://#{record.domain}/#{record.version}/#{operation}"

end
