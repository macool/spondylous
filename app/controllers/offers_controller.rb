class OffersController < ApplicationController
  expose(:user) {
    User.find params[:user_id]
  }
  expose(:offers, ancestor: :user)
  expose(:offer, attributes: :offer_params)
  expose(:transaction) {
    Transaction.new offer: offer
  }

  before_action :authenticate_user!, only: [:create]

  def create
    if offer.save
      redirect_to user_offers_path(user),
                  notice: I18n.t("views.offers.created")
    else
      render :new
    end
  end

  private

  def offer_params
    params.require(:offer).permit :title,
                                  :detail,
                                  :price_amount
  end
end
