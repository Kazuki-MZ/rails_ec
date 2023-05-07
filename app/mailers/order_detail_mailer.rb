# frozen_string_literal: true

class OrderDetailMailer < ApplicationMailer
  default from: 'noreply@example.com'
  def order_detail
    @order = params[:order]
    @cart_items = params[:cart_items]
    @promotion_code = params[:promotion_code]
    @total_amount = params[:total_amount]
    mail(
      subject: 'ご購入ありがとうございます',
      to: @order.email
    )
  end
end
