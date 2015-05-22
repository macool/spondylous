class PurchasesController < ApplicationController
  before_action :authenticate_user!

  expose(:user) {
    User.find params[:user_id]
  }
  expose(:offer) {
    Offer.find params[:offer_id]
  }
  expose(:transaction) {
    Transaction.new(
      offer: offer,
      account: current_user.account
    )
  }

  def create
    if transaction.save
      redirect_to user_payment_path(current_user, transaction),
                  notice: I18n.t("views.transactions.success")
    else
      flash[:error] = I18n.t("views.transactions.failure")
      render "offers/show"
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit :offer_id
  end
end
