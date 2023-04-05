# frozen_string_literal: true

class OrderDetailMailer < ApplicationMailer
  def create_mail
    @order
  end
end
