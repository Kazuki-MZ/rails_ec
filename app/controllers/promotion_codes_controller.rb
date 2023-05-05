# frozen_string_literal: true

class PromotionCodesController < ApplicationController
  def create
    code_name = promotion_code_params[:code_name]
    match_promotion_code = PromotionCode.find_by(code_name: code_name)
    if match_promotion_code && current_cart.promotion_code.blank?
      current_cart.update!(promotion_code: match_promotion_code)
      flash[:success] = 'プロモーションコードが適応されました'
    else
      flash[:alert] = 'このコードは無効です'
    end
    redirect_to new_order_path
  end

  private

  def promotion_code_params
    params.require(:promotion_code).permit(:code_name)
  end
end
