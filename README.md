# stripe-elixir

## Description

Elixir library to access the Stripe REST API.

## Usage

### Create a payment

```elixir
Stripe.private_key = "sk_test_abc123"

Stripe::Charge.create(
  :amount => 400,
  :currency => "cad",
  :card => "tok_2DbC", # obtained with Stripe.js
  :description => "Charge for test@example.com"
)
```