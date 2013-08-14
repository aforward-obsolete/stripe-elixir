defmodule Stripe.Curl do

  def cmd(url), do: "curl #{url}"
  def cmd(url,[]), do: cmd(url)
  def cmd(url,[h|t]), do: cmd( "#{url} #{param_to_cmd(h)}", t)

  def param_to_cmd({:u, val}), do: "-u #{val}:"

  def param_to_cmd({:d, key, val}) do
    if has_spaces?(key,val) do
      param_to_cmd({:d_space, key, val})
    else
      param_to_cmd({:d_no_space, key, val})
    end
  end

  #---------
  # PRIVATE
  #---------

  def param_to_cmd({:d_no_space, key, val}), do: "-d #{key}=#{val}"
  def param_to_cmd({:d_space, key, val}), do: "-d \"#{key}=#{val}\""
  defp has_spaces?(key,val), do: String.contains?("#{key}#{val}"," ")

end