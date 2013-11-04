defrecord Stripe, private_key: nil, protocol: "https", domain: "api.stripe.com", version: "v2" do

  def url(operation, record), do: "#{record.protocol}://#{record.domain}/#{record.version}/#{operation}"
  def cmd(params,url,record), do: Stripe.Curl.cmd(record.curl_params(params),url)

  def curl_param({ :private_key, private_key }, record), do: { :u, private_key }
  def curl_param({ :method, val }, record), do: { :x, val }
  def curl_param({ key, val }, record), do: { :d, key, val }
  def curl_params(params, record), do: Enum.map(params, &(curl_param(&1,record)))

end
