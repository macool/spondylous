class TransactionsController < ApplicationController
  before_action :authenticate_user!

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

    else

    end
  end
end
