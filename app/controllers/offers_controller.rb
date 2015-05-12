class OffersController < ApplicationController
  expose(:user) {
    User.find params[:user_id]
  }
  expose(:offer) {
    user.offers.find params[:id]
  }
end
