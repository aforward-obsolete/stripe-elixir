defmodule Stripe.Curl do

  def cmd(url), do: "curl #{url}"
  def cmd([],url), do: cmd(url)
  def cmd([h|t],url), do: cmd(t,"#{url} #{parameterize(h)}")

  def parameterize(input), do: convert_param(input)

  #---------
  # PRIVATE
  #---------

  defp convert_param({:u, val}), do: "-u #{val}:"
  defp convert_param({:x, val}), do: "-X #{upcase(val)}"
  defp convert_param({:d_no_space, key, val}), do: "-d #{key}=#{val}"
  defp convert_param({:d_space, key, val}), do: "-d \"#{key}=#{val}\""
  defp convert_param({:d, key, val}) do
    if has_spaces?(key,val) do
      convert_param({:d_space, key, val})
    else
      convert_param({:d_no_space, key, val})
    end
  end

  defp has_spaces?(key,val), do: String.contains?("#{key}#{val}"," ")
  defp upcase(val), do: String.upcase("#{val}")

end