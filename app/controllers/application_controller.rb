# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_cart
  add_flash_types :success

  private

  def current_cart
    @current_cart ||= Cart.find_by(id: session[:cart_id])
    @current_cart ||= Cart.create!
    session[:cart_id] = @current_cart.id
    @current_cart
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
