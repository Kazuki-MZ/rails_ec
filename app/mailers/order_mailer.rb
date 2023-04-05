# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  default from: 'noreply@example.com'
  def checkout_email
    @order = params[:order]

    mail(
      subject: 'ご購入ありがとうございます',
      to: @order.email
    )
  end
end
