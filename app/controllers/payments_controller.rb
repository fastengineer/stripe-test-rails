class PaymentsController < ApplicationController
  def new
  end

  def create
    token = params[:stripeToken]
    charge = Stripe::Charge.create({
      amount: 999,
      currency: 'usd',
      description: 'Example charge',
      source: token,
    })
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_payment_path
  end
end
